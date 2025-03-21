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

  @override
  // TODO: implement props
  List<Object?> get props => [
        username,
        email,
        state,
      ];
}
