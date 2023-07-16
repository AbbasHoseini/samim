import 'package:samim/core/resources/data_state.dart';
import 'package:samim/core/usecase/use_case.dart';
import 'package:samim/features/country/domain/entities/country_repository_entity.dart';
import 'package:samim/features/country/domain/repositories/country_repository.dart';



class GetCountryUseCase extends UseCase<DataState<List<CountryEntity>>, NoParams> {
  final CountryRepository countryRepository;
  GetCountryUseCase(this.countryRepository);

  @override
  Future<DataState<List<CountryEntity>>> call(NoParams param) {
    return countryRepository.getCountries();
  }
}
