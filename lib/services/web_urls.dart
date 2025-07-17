class WebUrls extends _BaseUrl {
  WebUrls._();
  static const String kSignInUrl = "${_BaseUrl._kBaseUrl}/admin/login";
  static const String kForgotPasswordOTPUrl =
      "${_BaseUrl._kBaseUrl}/driver/forgot-password";
  static const String kVerifyOTPUrl =
      "${_BaseUrl._kBaseUrl}/driver/verify-reset-code";
  static const String kResendOtpUrl =
      "${_BaseUrl._kBaseUrl}/driver/resend-reset-code";
  static const String kCreatePasswordUrl =
      "${_BaseUrl._kBaseUrl}/driver/reset-password";
  static const String kUpdateProfileUrl = "${_BaseUrl._kBaseUrl}/admin/me";
  static const String kGetUnApprovedDriversUrl =
      "${_BaseUrl._kBaseUrl}/admin/unapproved-drivers";
  static const String kGetDriverDetailUrl =
      "${_BaseUrl._kBaseUrl}/admin/driver";
  static const String kApproveDriverUrl =
      "${_BaseUrl._kBaseUrl}/admin/driver-approval";
  static const String kGetActiveDriversUrl =
      "${_BaseUrl._kBaseUrl}/admin/drivers";
  static const String kCustomerUrl = "${_BaseUrl._kBaseUrl}/admin/customer";
  static const String kGetRidesUrl = "${_BaseUrl._kBaseUrl}/admin/rides";
  static const String kGetSpecifcRideUrl = "${_BaseUrl._kBaseUrl}/admin/ride";
  static const String kStatsUrl = "${_BaseUrl._kBaseUrl}/admin/stats";
  static const String kRideStatsUrl = "${_BaseUrl._kBaseUrl}/admin/ride-stats";
  static const String kSupportUrl = "${_BaseUrl._kBaseUrl}/admin/support";
  static const String kGetRideIssuesUrl =
      "${_BaseUrl._kBaseUrl}/admin/rides-issues";
  static const String kGetSpecificRideIssueUrl =
      "${_BaseUrl._kBaseUrl}/admin/ride-issue";
}

abstract class _BaseUrl {
  static const String _kBaseUrl = 'https://backend.lahakniapp.com/api';
}
