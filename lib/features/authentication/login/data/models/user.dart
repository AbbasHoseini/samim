import 'dart:convert';

import 'package:samim/features/authentication/login/domain/entities/user_entity.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User extends UserEntity {
  const User({
    username,
    email,
    state,
  }) : super(username: username, email: email, state: state);


  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "state": state,
      };
}
