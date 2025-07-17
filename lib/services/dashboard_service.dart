import 'package:lahakni_web/models/response_model.dart';
import 'package:lahakni_web/services/http_request.dart';
import 'package:lahakni_web/services/web_urls.dart';
import 'package:lahakni_web/utils/session_management/session_management.dart';
import 'package:lahakni_web/utils/session_management/session_token_keys.dart';

class DashboardService {
  DashboardService._();

  static final DashboardService _instance = DashboardService._();

  factory DashboardService() {
    return _instance;
  }

  final HTTPRequestClient _client = HTTPRequestClient();
  final SessionManagement _sessionManagement = SessionManagement();

  Future<dynamic> getStats() async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: WebUrls.kStatsUrl,
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return responseModel.data['data'];
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> getRideStats({required String type}) async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kRideStatsUrl}?type=$type",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return responseModel.data['data'];
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }
}
