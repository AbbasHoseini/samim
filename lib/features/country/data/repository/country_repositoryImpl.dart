import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:samim/features/authentication/login/data/data_source/remote/remote_api_provider.dart';
import 'package:samim/core/resources/data_state.dart';
import 'package:samim/features/country/data/models/country_model.dart';
import 'package:samim/features/country/domain/entities/country_repository_entity.dart';
import 'package:samim/features/country/domain/repositories/country_repository.dart';

class CountryRepositoryImpl extends CountryRepository {
  RemoteApiProvider apiProvider;
  CountryRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<CountryEntity>>> getCountries() async {
    try {
      Response response = await apiProvider.getCountries();
      if (response.statusCode == 200) {

        List<CountryEntity> countryEntity = List<CountryModel>.from(
            json.decode(response.data).map((x) => CountryModel.fromJson(x)));

        return DataSuccess(countryEntity, null);
      } else {
        return const DataFailed("خطایی رخ داده است.");
      }
    } catch (e, st) {
      debugPrint('getcountry error $e $st');
      return const DataFailed("خطایی رخ داده سات");
    }
  }
}
