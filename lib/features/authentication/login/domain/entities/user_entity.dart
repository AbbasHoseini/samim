import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? username;
  final String? email;
  final String? state;

  const UserEntity({
    this.username,
    this.email,
    this.state,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        username: json["username"],
        email: json["email"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "state": state,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        username,
        email,
        state,
      ];
}
