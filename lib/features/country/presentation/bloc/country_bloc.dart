import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:samim/core/resources/data_state.dart';
import 'package:samim/core/usecase/use_case.dart';
import 'package:samim/features/country/domain/use_cases/get_country_usecase.dart';
import 'package:samim/features/country/presentation/bloc/country_status.dart';

part 'country_bloc_event.dart';
part 'country_bloc_state.dart';

class CountryBloc extends Bloc<HomeBlocEvent, CountryBlocState> {
  final GetCountryUseCase getCountryUseCase;

  CountryBloc(this.getCountryUseCase)
      : super(CountryBlocState(countryStatus: CountryLoading())) {
    on<LoadCountryEvent>((event, emit) async {
      emit(state.copyWith(newCountryStatus: CountryLoading()));

      DataState dataState = await getCountryUseCase.call(NoParams());
      debugPrint('country bloc result ${dataState.message} ${dataState.data}');

      if (dataState is DataSuccess) {
        emit(
            state.copyWith(newCountryStatus: CountryCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(
            state.copyWith(newCountryStatus: CountryError(dataState.message!)));
      }
    });
  }
}
