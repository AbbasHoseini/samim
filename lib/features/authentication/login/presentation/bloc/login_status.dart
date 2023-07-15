import 'package:flutter/material.dart';
import 'package:samim/features/authentication/login/domain/entities/country_repository_entity.dart';

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
