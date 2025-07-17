class DriverModel {
  String userId = "";
  String name = "";
  String role = "";
  String createdAt = "";
  String vehicleType = "";

  DriverModel.empty();

  DriverModel({
    required this.userId,
    required this.name,
    required this.role,
    required this.createdAt,
    required this.vehicleType,
  });

  DriverModel.fromJson(Map<String, dynamic> json) {
    userId = json["_id"] ?? json["id"] ?? "";
    name = json["username"] ?? "";
    role = json["role"] ?? "";
    createdAt = json["createdAt"] ?? "";
    vehicleType = json["vehicleType"] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      "id": userId,
      "username": name,
      "role": role,
      "createdAt": createdAt,
      "vehicleType": vehicleType,
    };
  }
}
