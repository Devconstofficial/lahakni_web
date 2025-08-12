import 'package:lahakni_web/models/user_model.dart';

class RideModel {
  String id = "";
  String status = "";
  String rideType = "";
  String from = "";
  String to = "";
  String customerId = "";
  String riderId = "";
  String recommendedFare = "";
  String offeredFare = "";
  bool isPaid = false;
  String? acceptedAt;
  String? startedAt;
  String? completedAt;
  String? canceledAt;
  double? distanceKm;
  double? distanceMiles;
  Location? pickupLocation;
  Location? dropoffLocation;
  String createdAt = "";
  UserModel? customer;
  UserModel? rider;

  RideModel.empty();

  RideModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    status = json["status"] ?? "";
    rideType = json["rideType"] ?? "";
    from = json["from"] ?? "";
    to = json["to"] ?? "";
    customerId = json["customerId"] ?? "";
    riderId = json["riderId"] ?? "";
    recommendedFare = json["recommendedFare"].toString() ?? "";
    offeredFare = json["offeredFare"].toString() ?? "";
    isPaid = json["isPaid"] ?? false;
    acceptedAt = json["acceptedAt"];
    startedAt = json["startedAt"];
    completedAt = json["completedAt"];
    canceledAt = json["canceledAt"];
    distanceKm = json["distanceKm"]?.toDouble();
    distanceMiles = json["distanceMiles"]?.toDouble();
    pickupLocation =
        json["pickupLocation"] != null
            ? Location.fromJson(json["pickupLocation"])
            : null;
    dropoffLocation =
        json["dropoffLocation"] != null
            ? Location.fromJson(json["dropoffLocation"])
            : null;
    createdAt = json["createdAt"] ?? "";
    customer =
        json["customer"] != null ? UserModel.fromJson(json["customer"]) : null;

    rider = json["rider"] != null ? UserModel.fromJson(json["rider"]) : null;
  }
}

class Location {
  String type = "";
  List<double> coordinates = [];

  Location.fromJson(Map<String, dynamic> json) {
    type = json["type"] ?? "";
    coordinates =
        (json["coordinates"] as List<dynamic>?)
            ?.map((e) => double.tryParse(e.toString()) ?? 0.0)
            .toList() ??
        [];
  }
}
