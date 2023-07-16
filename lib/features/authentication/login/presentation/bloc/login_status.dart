import 'package:flutter/material.dart';


@immutable
abstract class LoginStatus {}

class LoginLoading extends LoginStatus {}

class LoginCompleted extends LoginStatus {
  // LoginCompleted();
}

class LoginError extends LoginStatus {
  final String message;
  LoginError(this.message);
}

class LoginInitial extends LoginStatus {}
