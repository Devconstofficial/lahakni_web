import 'package:lahakni_web/models/customer_model.dart';
import 'package:lahakni_web/models/driver_detail_model.dart';
import 'package:lahakni_web/models/driver_model.dart';
import 'package:lahakni_web/models/response_model.dart';
import 'package:lahakni_web/services/http_request.dart';
import 'package:lahakni_web/services/web_urls.dart';
import 'package:lahakni_web/utils/session_management/session_management.dart';
import 'package:lahakni_web/utils/session_management/session_token_keys.dart';

class DriverService {
  DriverService._();

  static final DriverService _instance = DriverService._();

  factory DriverService() {
    return _instance;
  }

  final HTTPRequestClient _client = HTTPRequestClient();
  final SessionManagement _sessionManagement = SessionManagement();

  Future<dynamic> getUnApprovedDrivers() async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kGetUnApprovedDriversUrl}?limit=5000",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return (responseModel.data['data']["drivers"] as List)
          .map((json) => DriverModel.fromJson(json))
          .toList();
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> approveDriverStatus({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'PUT',
      url: WebUrls.kApproveDriverUrl,
      requestBody: {"driverId": id, "isApproved": true},
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return true;
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> rejectDriverStatus({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'PUT',
      url: WebUrls.kApproveDriverUrl,
      requestBody: {"driverId": id, "isApproved": false},
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return true;
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> getDriverDetail({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kGetDriverDetailUrl}/$id",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return DriverDetailModel.fromJson(responseModel.data['data']);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> getActiveDrivers() async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kGetActiveDriversUrl}?limit=5000",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return (responseModel.data['data']["drivers"] as List)
          .map((json) => CustomerModel.fromJson(json))
          .toList();
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> suspendDiver({
    required String id,
    required bool value,
  }) async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'PUT',
      url: "${WebUrls.kGetDriverDetailUrl}/suspend/$id",
      requestBody: {"isSuspend": value},
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return CustomerModel.fromJson(responseModel.data['data']['user']);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }
}
