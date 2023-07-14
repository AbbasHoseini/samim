import 'package:flutter/material.dart';
import 'package:samim/features/authentication/login/domain/entities/country_repository_entity.dart';

@immutable
abstract class LoginStatus {}

class LoginLoading extends LoginStatus {}


class LoginCompleted extends LoginStatus {
  final CountryEntity countryEntity;
  LoginCompleted(this.countryEntity);
}

class LoginError extends LoginStatus {
  final String message;
  LoginError(this.message);
}

class LoginInitial extends LoginStatus {}
