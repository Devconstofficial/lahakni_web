import 'package:lahakni_web/models/response_model.dart';
import 'package:lahakni_web/models/ride_report_model.dart';
import 'package:lahakni_web/models/support_model.dart';
import 'package:lahakni_web/services/http_request.dart';
import 'package:lahakni_web/services/web_urls.dart';
import 'package:lahakni_web/utils/session_management/session_management.dart';
import 'package:lahakni_web/utils/session_management/session_token_keys.dart';

class SupportService {
  SupportService._();

  static final SupportService _instance = SupportService._();

  factory SupportService() {
    return _instance;
  }

  final HTTPRequestClient _client = HTTPRequestClient();
  final SessionManagement _sessionManagement = SessionManagement();

  Future<dynamic> getAllSupportMessages() async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kSupportUrl}?limit=5000",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return (responseModel.data['data']["supports"] as List)
          .map((json) => SupportModel.fromJson(json))
          .toList();
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> getAllRideIssues() async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kGetRideIssuesUrl}?limit=5000",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return (responseModel.data['data']["cancelRides"] as List)
          .map((json) => RideReportModel.fromJson(json))
          .toList();
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> getSupportMessageDetail({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kSupportUrl}/$id",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return SupportModel.fromJson(responseModel.data['data']);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> getRideIssueDetail({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kGetSpecificRideIssueUrl}/$id",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return RideReportModel.fromJson(responseModel.data['data']);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }
}
