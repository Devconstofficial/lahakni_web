import 'dart:developer';

import 'package:lahakni_web/models/customer_model.dart';
import 'package:lahakni_web/models/response_model.dart';
import 'package:lahakni_web/services/http_request.dart';
import 'package:lahakni_web/services/web_urls.dart';
import 'package:lahakni_web/utils/session_management/session_management.dart';
import 'package:lahakni_web/utils/session_management/session_token_keys.dart';

class CustomerService {
  CustomerService._();

  static final CustomerService _instance = CustomerService._();

  factory CustomerService() {
    return _instance;
  }

  final HTTPRequestClient _client = HTTPRequestClient();
  final SessionManagement _sessionManagement = SessionManagement();

  Future<dynamic> getCustomers() async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kCustomerUrl}?limit=5000",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return (responseModel.data['data']["customers"] as List)
          .map((json) => CustomerModel.fromJson(json))
          .toList();
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> suspendCustomer({
    required String id,
    required bool value,
  }) async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'PUT',
      url: "${WebUrls.kCustomerUrl}/suspend/$id",
      requestBody: {"isSuspend": value},
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );
    log("$responseModel");
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return CustomerModel.fromJson(responseModel.data['data']['user']);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> getCustomerDetail({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
      tokenKey: SessionTokenKeys.kUserTokenKey,
    );
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kCustomerUrl}/$id",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token',
      },
    );
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return CustomerModel.fromJson(responseModel.data['data']);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }
}
