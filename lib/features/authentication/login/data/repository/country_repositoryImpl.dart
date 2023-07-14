import 'package:dio/dio.dart';
import 'package:samim/features/authentication/login/data/data_source/remote/remote_api_provider.dart';
import 'package:samim/features/authentication/login/data/models/country_model.dart';
import 'package:samim/features/authentication/login/domain/entities/country_repository_entity.dart';
import 'package:samim/core/resources/data_state.dart';
import 'package:samim/features/authentication/login/domain/repositories/country_repository.dart';

class CountryRepositoryImpl extends CountryRepository {
  RemoteApiProvider apiProvider;
  CountryRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CountryEntity>> getCountries() async {
    try {
      Response response = await apiProvider.getCountries();
      if (response.statusCode == 200) {
        CountryEntity countryEntity = CountryModel.fromJson(response.data);

        return DataSuccess(countryEntity);
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } catch (e) {
      return const DataFailed("please check your connection...");
    }
  }


}
