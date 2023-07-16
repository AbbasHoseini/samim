import 'package:get_it/get_it.dart';
import 'package:samim/features/authentication/login/data/data_source/local/local_api_provider.dart';
import 'package:samim/features/authentication/login/data/data_source/remote/remote_api_provider.dart';
import 'package:samim/features/authentication/login/data/repository/login_repositoryImpl.dart';
import 'package:samim/features/authentication/login/domain/repositories/login_repository.dart';
import 'package:samim/features/authentication/login/domain/use_cases/login_usecase.dart';
import 'package:samim/features/authentication/login/presentation/bloc/home_bloc.dart';
import 'package:samim/features/country/data/repository/country_repositoryImpl.dart';
import 'package:samim/features/country/domain/repositories/country_repository.dart';
import 'package:samim/features/country/domain/use_cases/get_country_usecase.dart';
import 'package:samim/features/country/presentation/bloc/country_bloc.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<RemoteApiProvider>(RemoteApiProvider());
  locator.registerSingleton<LocalApiProvider>(LocalApiProvider());

  ///repositories
  locator
      .registerSingleton<CountryRepository>(CountryRepositoryImpl(locator()));
  locator.registerSingleton<LoginRepository>(LoginRepositoryImpl(locator()));

  ///use cases
  locator.registerSingleton<GetCountryUseCase>(GetCountryUseCase(locator()));
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));

  ///bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
  locator.registerSingleton<CountryBloc>(CountryBloc(locator()));
}
