@extends('admin.layouts.app')
@section('panel')
<div class="row mb-none-30">
  <div class="col-md-12">
    <div class="card b-radius--10 ">
      <div class="card-body p-0">
        <div class="table-responsive--md  table-responsive">
          <table class="table table--light style--two">
            <thead>
              <tr>
                <th>@lang('Type')</th>
                <th>@lang('Message')</th>
                <th>@lang('Status')</th>
              </tr>
            </thead>
            <tbody>
              @forelse($reports as $report)
              <tr>
                <td>{{ @$report->req_type }}</td>
                <td class="text-center white-space-wrap">{{ @$report->message }}</td>
                <td><span class="badge badge--{{ @$report->status_class }}">{{ @$report->status_text }}</span></td>
              </tr>
              @empty
              <tr>
                <td colspan="100%" class="text-center">@lang('Data not found')</td>
              </tr>
              @endforelse
            </tbody>
          </table><!-- table end -->
        </div>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="bugModal" tabindex="-1" role="dialog" aria-labelledby="bugModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bugModalLabel">@lang('Report & Request')</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action method="post">
        @csrf
        <div class="modal-body">
          <div class="form-group">
            <label>@lang('Type')</label>
            <select class="form-control" name="type">
              <option value="bug">@lang('Report Bug')</option>
              <option value="feature">@lang('Feature Request')</option>
            </select>
          </div>
          <div class="form-group">
            <label>@lang('Message')</label>
            <textarea class="form-control" name="message">{{ old('message') }}</textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
          <button type="submit" class="btn btn--primary">@lang('Report')</button>
        </div>
      </form>
    </div>
  </div>
</div>
@endsection
@push('breadcrumb-plugins')
<button class="btn btn--primary" data-toggle="modal" data-target="#bugModal">@lang('Report a bug')</button>
@endpush