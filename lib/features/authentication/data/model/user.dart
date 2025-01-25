import 'dart:developer';

import 'package:auth_app/features/authentication/domain/entities/user_entity.dart';

class UserModel extends User{
  UserModel({required super.name, required super.id, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    log("id: ${json["id"]}, name: ${json["user_metadata"]["name"]} email: ${json["email"]}");

    return UserModel(
      id: json["id"],
      name: json["user_metadata"]["name"],
      email: json["email"],
    );
  }
}