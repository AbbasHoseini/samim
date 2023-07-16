

import 'package:samim/core/resources/data_state.dart';
import 'package:samim/features/country/domain/entities/country_repository_entity.dart';


abstract class CountryRepository {
    Future<DataState<List<CountryEntity>>> getCountries();
}