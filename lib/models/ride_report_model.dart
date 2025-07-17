import 'package:lahakni_web/models/user_model.dart';

class RideReportModel {
  String id = "";
  String customerId = "";
  String driverId = "";
  String reason = "";
  String message = "";
  String createdAt = "";
  UserModel? customer;
  UserModel? driver;

  RideReportModel();

  RideReportModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    customerId = json["customerId"] ?? "";
    driverId = json["driverid"] ?? "";
    reason = json["reason"] ?? "";
    message = json["message"] ?? "";
    createdAt = json["createdAt"] ?? "";
    customer =
        json["customer"] != null ? UserModel.fromJson(json["customer"]) : null;
    driver = json["driver"] != null ? UserModel.fromJson(json["driver"]) : null;
  }
}
