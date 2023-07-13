import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:samim/core/resources/data_state.dart';
import 'package:samim/features/authentication/login/domain/use_cases/get_country_usecase.dart';
import 'package:samim/features/authentication/login/presentation/bloc/login_status.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final GetCountryUseCase getCountryUseCase;

  HomeBloc(this.getCountryUseCase)
      : super(HomeBlocState(loginStatus: LoginLoading())) {
    on<LoadLoginEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoginLoading()));


      DataState dataState = await getCountryUseCase('');

      if (dataState is DataSuccess) {
        emit(state.copyWith(newLoginStatus: LoginCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(newLoginStatus: LoginError(dataState.error!)));
      }

    });
  }
  
}
