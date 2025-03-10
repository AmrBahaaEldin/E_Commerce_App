class ProfileMeModel {
  final bool status;
  final String? message;
  final UserData? data;

  ProfileMeModel({required this.status, this.message, this.data});

  factory ProfileMeModel.fromJson(Map<String, dynamic> json) {
    return ProfileMeModel(
      status: json['status'] ?? false,
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? image;
  final String? token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'],
      token: json['token'],
    );
  }
}