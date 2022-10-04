<?php

namespace App\Http\Controllers\Gateway\StripeJs;

use App\Models\Deposit;
use App\Http\Controllers\Gateway\PaymentController;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Session;
use Stripe\Charge;
use Stripe\Customer;
use Stripe\Stripe;


class ProcessController extends Controller
{

    public static function process($deposit)
    {
        $StripeJSAcc = json_decode($deposit->gatewayCurrency()->gateway_parameter);
        $val['key'] = $StripeJSAcc->publishable_key;
        $val['name'] = Auth::user()->username;
        $val['description'] = "Payment with Stripe";
        $val['amount'] = $deposit->final_amo * 100;
        $val['currency'] = $deposit->method_currency;
        $send['val'] = $val;


        $alias = $deposit->gateway->alias;

        $send['src'] = "https://checkout.stripe.com/checkout.js";
        $send['view'] = 'user.payment.' . $alias;
        $send['method'] = 'post';
        $send['url'] = route('ipn.'.$deposit->gateway->alias);
        return json_encode($send);
    }

    public function ipn(Request $request)
    {

        $track = Session::get('Track');
        $deposit = Deposit::where('trx', $track)->orderBy('id', 'DESC')->first();
        if ($deposit->status == 1) {
            $notify[] = ['error', 'Invalid request.'];
            return redirect()->route(gatewayRedirectUrl())->withNotify($notify);
        }
        $StripeJSAcc = json_decode($deposit->gatewayCurrency()->gateway_parameter);


        Stripe::setApiKey($StripeJSAcc->secret_key);

        Stripe::setApiVersion("2020-03-02");

        $customer =  Customer::create([
            'email' => $request->stripeEmail,
            'source' => $request->stripeToken,
        ]);

        $charge = Charge::create([
            'customer' => $customer->id,
            'description' => 'Payment with Stripe',
            'amount' => $deposit->final_amo * 100,
            'currency' => $deposit->method_currency,
        ]);


        if ($charge['status'] == 'succeeded') {
            PaymentController::userDataUpdate($deposit->trx);
            $notify[] = ['success', 'Payment captured successfully.'];
            return redirect()->route(gatewayRedirectUrl(true))->withNotify($notify);
        }else{
            $notify[] = ['success', 'Failed to process.'];
            return redirect()->route(gatewayRedirectUrl())->withNotify($notify);
        }
    }
}
