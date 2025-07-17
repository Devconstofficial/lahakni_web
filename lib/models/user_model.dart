class UserModel {
  String userId = "";
  String name = "";
  String userImage = "";
  String role = "";
  String createdAt = "";
  bool isVerified = false;
  String phoneNumber = "";
  String email = "";

  UserModel.empty();

  UserModel({
    required this.userId,
    required this.name,
    required this.userImage,
    required this.role,
    required this.createdAt,
    required this.phoneNumber,
    required this.email,
  });

  UserModel copyWith({
    String? userId,
    String? name,
    String? userImage,
    String? role,
    String? createdAt,
    bool? isVerified,
    String? phoneNumber,
    String? email,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      userImage: userImage ?? this.userImage,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json["_id"] ?? json["id"] ?? "";
    name = json["username"] ?? "";
    userImage = json["profileImage"] ?? "";
    role = json["role"] ?? "";
    createdAt = json["createdAt"] ?? "";
    isVerified = json["isVerified"] ?? false;
    phoneNumber = json["phoneNumber"] ?? "";
    email = json["email"] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      "id": userId,
      "username": name,
      "profileImage": userImage,
      "role": role,
      "createdAt": createdAt,
      "phoneNumber": phoneNumber,
      "email": email,
    };
  }
}
