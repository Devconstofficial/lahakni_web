import 'package:lahakni_web/models/ride_model.dart';

class DriverDetailModel {
  String userId = "";
  String name = "";
  String role = "";
  String createdAt = "";
  String updatedAt = "";
  String email = "";
  String phoneNumber = "";
  String userImage = "";
  bool isVerified = false;
  bool isSuspend = false;
  int totalRides = 0;
  int canceledRides = 0;
  int completedRides = 0;
  int totalEarnings = 0;

  List<DriverDetail> driverDetails = [];
  List<InsuranceDetail> insurenceDetail = [];
  List<ImageModel> interiorImages = [];
  List<ImageModel> exteriorImages = [];
  List<RideModel> rides = [];

  DriverDetailModel.empty();

  DriverDetailModel.fromJson(Map<String, dynamic> json) {
    userId = json["_id"] ?? json["id"] ?? "";
    name = json["username"] ?? "";
    role = json["role"] ?? "";
    email = json["email"] ?? "";
    createdAt = json["createdAt"] ?? "";
    updatedAt = json["updatedAt"] ?? "";
    isVerified = json["isVerified"] ?? false;
    isSuspend = json["isSuspend"] ?? false;
    phoneNumber = json["phoneNumber"] ?? "";
    userImage = json["profileImage"] ?? "";
    totalRides = json["totalRides"] ?? 0;
    canceledRides = json["canceledRides"] ?? 0;
    completedRides = json["completedRides"] ?? 0;
    totalEarnings = json["totalEarnings"] ?? 0;

    driverDetails =
        (json["driverDetails"] as List<dynamic>? ?? [])
            .map((e) => DriverDetail.fromJson(e))
            .toList();

    insurenceDetail =
        (json["insurenceDetail"] as List<dynamic>? ?? [])
            .map((e) => InsuranceDetail.fromJson(e))
            .toList();

    interiorImages =
        (json["interiorImages"] as List<dynamic>? ?? [])
            .map((e) => ImageModel.fromJson(e))
            .toList();

    exteriorImages =
        (json["exteriorImages"] as List<dynamic>? ?? [])
            .map((e) => ImageModel.fromJson(e))
            .toList();

    rides =
        (json["rides"] as List<dynamic>? ?? [])
            .map((e) => RideModel.fromJson(e))
            .toList();
  }
}

class DriverDetail {
  String id = "";
  String licenseNumber = "";
  String licenseExpiry = "";
  String drivingLicenseFrontImage = "";
  String drivingLicenseBackImage = "";
  String selfieImage = "";
  String vehicleNumber = "";
  String vehicleIssueState = "";
  String vehicleType = "";
  bool isApproved = false;
  String address = "";
  String latitude = "";
  String longitude = "";
  String vehicleModel = "";

  DriverDetail.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    licenseNumber = json["licenseNumber"] ?? "";
    licenseExpiry = json["licenseExpiry"] ?? "";
    drivingLicenseFrontImage = json["drivingLicenseFrontImage"] ?? "";
    drivingLicenseBackImage = json["drivingLicenseBackImage"] ?? "";
    selfieImage = json["selfieImage"] ?? "";
    vehicleNumber = json["vehicleNumber"] ?? "";
    vehicleIssueState = json["vehicleIssueState"] ?? "";
    vehicleType = json["vehicleType"] ?? "";
    isApproved = json["isApproved"] ?? false;
    address = json["address"] ?? "";
    latitude = json["latitude"] ?? "";
    longitude = json["longitude"] ?? "";
    vehicleModel = json["vehicleModel"] ?? "";
  }
}

class InsuranceDetail {
  String id = "";
  String firstName = "";
  String lastName = "";
  String country = "";
  String zipCode = "";
  String insuranceCompany = "";
  String insurancePolicyNumber = "";
  String policyStartDate = "";
  String policyEndDate = "";
  bool isInsurenceFullCovered = false;
  bool isLiabilityCovered = false;
  bool isPayDamageVehicleCovered = false;

  InsuranceDetail.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    firstName = json["firstName"] ?? "";
    lastName = json["lastName"] ?? "";
    country = json["country"] ?? "";
    zipCode = json["zipCode"] ?? "";
    insuranceCompany = json["insuranceCompany"] ?? "";
    insurancePolicyNumber = json["insurancePolicyNumber"] ?? "";
    policyStartDate = json["policyStartDate"] ?? "";
    policyEndDate = json["policyEndDate"] ?? "";
    isInsurenceFullCovered = json["isInsurenceFullCovered"] ?? false;
    isLiabilityCovered = json["isLiabilityCovered"] ?? false;
    isPayDamageVehicleCovered = json["isPayDamageVehicleCovered"] ?? false;
  }
}

class ImageModel {
  String id = "";
  String imageUrl = "";

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    imageUrl = json["imageUrl"] ?? "";
  }
}
