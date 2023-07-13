import 'package:samim/core/resources/data_state.dart';
import 'package:samim/core/usecase/use_case.dart';
import 'package:samim/features/authentication/login/domain/entities/country_repository_entity.dart';
import 'package:samim/features/authentication/login/domain/repositories/country_repository.dart';


class GetCountryUseCase extends UseCase<DataState<CountryEntity>, String> {
  final CountryRepository countryRepository;
  GetCountryUseCase(this.countryRepository);

  @override
  Future<DataState<CountryEntity>> call(String param) {
    return countryRepository.getCountries();
  }
}
