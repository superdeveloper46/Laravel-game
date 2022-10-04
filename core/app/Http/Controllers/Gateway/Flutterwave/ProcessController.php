<?php

namespace App\Http\Controllers\Gateway\Flutterwave;

use App\Models\Deposit;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Gateway\PaymentController;
use Auth;

class ProcessController extends Controller
{
    /*
     * flutterwave Gateway
     */

    public static function process($deposit)
    {
        $flutterAcc = json_decode($deposit->gatewayCurrency()->gateway_parameter);

        $send['API_publicKey'] = $flutterAcc->public_key;
        $send['encryption_key'] = $flutterAcc->encryption_key;
        $send['customer_email'] = Auth::user()->email;
        $send['amount'] = round($deposit->final_amo,2);
        $send['customer_phone'] = Auth::user()->mobile;
        $send['currency'] = $deposit->method_currency;
        $send['txref'] = $deposit->trx;
        $send['notify_url'] = url('ipn/flutterwave');



        $alias = $deposit->gateway->alias;
        $send['view'] = 'user.payment.'.$alias;
        return json_encode($send);
    }

    public function ipn($track, $type)
    {

        $deposit = Deposit::where('trx', $track)->orderBy('id', 'DESC')->first();

        if ($type == 'error') {
            $message = 'Transaction failed, Ref: ' . $track;
            $notify[] = ['error', $message];
            $notifyApi[] = $message;
            if ($deposit->from_api) {
                return response()->json([
                    'code'=>200,
                    'status'=>'ok',
                    'message'=>['error'=>$notifyApi]
                ]);
            }
            return redirect()->route(gatewayRedirectUrl())->withNotify($notify);

        }

        if (!isset($track)) {

            $message = 'Unable to process';
            $notify[] = ['error', $message];
            $notifyApi[] = $message;

            if ($deposit->from_api) {
                return response()->json([
                    'code'=>200,
                    'status'=>'ok',
                    'message'=>['error'=>$notifyApi]
                ]);
            }
            return redirect()->route(gatewayRedirectUrl())->withNotify($notify);
        }

        $flutterAcc = json_decode($deposit->gatewayCurrency()->gateway_parameter);

        $query = array(
            "SECKEY" =>  $flutterAcc->secret_key,
            "txref" => $track
        );

        $data_string = json_encode($query);
        $ch = curl_init('https://api.ravepay.co/flwv3-pug/getpaidx/api/v2/verify');
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
        $response = curl_exec($ch);
        curl_close($ch);
        $response = json_decode($response);        
        $deposit->detail = $response->data;
        $deposit->save();

        if ($response->status == 'error') {
            $message = $response->message;
            $notify[] = ['error', $message];
            $notifyApi[] = $message;

            if ($deposit->from_api) {
                return response()->json([
                    'code'=>200,
                    'status'=>'ok',
                    'message'=>['error'=>$notifyApi]
                ]);
            }

            return redirect()->route(gatewayRedirectUrl())->withNotify($notify);
        }

        if ($response->data->status == "successful" && $response->data->chargecode == "00" && $deposit->final_amo == $response->data->amount && $deposit->method_currency == $response->data->currency && $deposit->status == '0') {
            PaymentController::userDataUpdate($deposit->trx);


            $message = 'Transaction was successful, Ref: ' . $track;
            $notify[] = ['success', $message];
            $notifyApi[] = $message;

            if ($deposit->from_api) {
                return response()->json([
                    'code'=>200,
                    'status'=>'ok',
                    'message'=>['success'=>$notifyApi]
                ]);
            }



            return redirect()->route(gatewayRedirectUrl(true))->withNotify($notify);
        }

        $message = 'Unable to process';
        $notify[] = ['error', $message];
        $notifyApi[] = $message;

        if ($deposit->from_api) {
            return response()->json([
                'code'=>200,
                'status'=>'ok',
                'message'=>['error'=>$notifyApi]
            ]);
        }


        return redirect()->route(gatewayRedirectUrl())->withNotify($notify);
        
    }
}
