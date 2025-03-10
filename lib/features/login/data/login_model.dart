import 'package:e_commerce_app/features/login/data/login_model.dart';
import 'package:flutter/foundation.dart';

class LoginModel {
  bool status;
  String message;
  USerData ?data;

  LoginModel({required this.status, required this.message,this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        status: json['status'],
        message:json['message'] ,
        data: json['data'] != null ? USerData.fromJson(json['data']) : null,
    );
  }
}

class USerData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String token;

  USerData(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.token});
  factory USerData.fromJson(Map<String, dynamic> json) {
    return USerData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        token: json['token']);
  }

}
