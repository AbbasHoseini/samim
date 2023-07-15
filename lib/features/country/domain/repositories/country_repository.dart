

import 'package:samim/core/resources/data_state.dart';
import 'package:samim/features/authentication/login/domain/entities/country_repository_entity.dart';


abstract class CountryRepository {
    Future<DataState<CountryEntity>> getCountries();
}