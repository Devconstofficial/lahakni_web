class SupportModel {
  final String id;
  final String userId;
  final String name;
  final String email;
  final String message;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? profileImage;

  SupportModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    this.profileImage,
  });

  factory SupportModel.fromJson(Map<String, dynamic> json) {
    return SupportModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      message: json['message'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      profileImage: json['user']?['profileImage'] ?? json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'message': message,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'profileImage': profileImage,
    };
  }
}
