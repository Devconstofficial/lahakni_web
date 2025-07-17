import 'package:lahakni_web/models/ride_model.dart';

class CustomerModel {
  String id = "";
  String phoneNumber = "";
  String email = "";
  String role = "";
  String username = "";
  String profileImage = "";
  bool isSuspend = false;
  bool isVerified = false;
  String createdAt = "";
  String updatedAt = "";
  int totalRides = 0;
  int challenges = 0;
  int completed = 0;
  int canceled = 0;
  List<dynamic> savedPlaces = [];
  List<RideModel> rides = [];

  CustomerModel.empty();

  CustomerModel({
    required this.id,
    required this.phoneNumber,
    required this.email,
    required this.role,
    required this.username,
    required this.profileImage,
    required this.isSuspend,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.totalRides,
    required this.challenges,
    required this.completed,
    required this.savedPlaces,
    required this.canceled,
    required this.rides,
  });

  CustomerModel copyWith({
    String? id,
    String? phoneNumber,
    String? email,
    String? role,
    String? username,
    String? profileImage,
    bool? isSuspend,
    bool? isVerified,
    String? createdAt,
    String? updatedAt,
    int? totalRides,
    int? challenges,
    int? completed,
    List<dynamic>? savedPlaces,
    int? canceled,
    List<RideModel>? rides,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      role: role ?? this.role,
      username: username ?? this.username,
      profileImage: profileImage ?? this.profileImage,
      isSuspend: isSuspend ?? this.isSuspend,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      totalRides: totalRides ?? this.totalRides,
      challenges: challenges ?? this.challenges,
      completed: completed ?? this.completed,
      savedPlaces: savedPlaces ?? this.savedPlaces,
      canceled: canceled ?? this.canceled,
      rides: rides ?? this.rides,
    );
  }

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? json["_id"] ?? "";
    phoneNumber = json["phoneNumber"] ?? "";
    email = json["email"] ?? "";
    role = json["role"] ?? "";
    username = json["username"]?.trim() ?? "";
    profileImage = json["profileImage"] ?? "";
    isSuspend = json["isSuspend"] ?? false;
    isVerified = json["isVerified"] ?? false;
    createdAt = json["createdAt"] ?? "";
    updatedAt = json["updatedAt"] ?? "";
    totalRides = json["totalRides"] ?? 0;
    challenges = json["challenges"] ?? 0;
    completed = json["completedRides"] ?? json["completed"] ?? 0;
    canceled = json["canceledRides"] ?? json["canceled"] ?? 0;
    savedPlaces = json["savedPlaces"] ?? [];

    rides =
        (json["rides"] as List<dynamic>? ?? [])
            .map((e) => RideModel.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "phoneNumber": phoneNumber,
      "email": email,
      "role": role,
      "username": username,
      "profileImage": profileImage,
      "isSuspend": isSuspend,
      "isVerified": isVerified,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "totalRides": totalRides,
      "challenges": challenges,
      "completed": completed,
      "canceled": canceled,
      "savedPlaces": savedPlaces,
    };
  }
}
