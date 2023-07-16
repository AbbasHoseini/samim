import 'package:flutter/material.dart';
import 'package:samim/features/country/domain/entities/country_repository_entity.dart';

@immutable
abstract class CountryStatus {}

class CountryLoading extends CountryStatus {}


class CountryCompleted extends CountryStatus {
  final List<CountryEntity> countryEntity;
  CountryCompleted(this.countryEntity);

    @override
  List<Object?> get props => [countryEntity];
}

class CountryError extends CountryStatus {
  final String message;
  CountryError(this.message);
}

class CountryInitial extends CountryStatus {}
