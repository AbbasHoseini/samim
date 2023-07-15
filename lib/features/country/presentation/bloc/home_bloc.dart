import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:samim/core/resources/data_state.dart';
import 'package:samim/features/authentication/login/data/models/email_password_params_model.dart';
import 'package:samim/features/authentication/login/domain/use_cases/login_usecase.dart';
import 'package:samim/features/authentication/login/presentation/bloc/login_status.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  // final GetCountryUseCase getCountryUseCase;
  final LoginUseCase loginUseCase;

  HomeBloc(this.loginUseCase)
      : super(HomeBlocState(loginStatus: LoginInitial())) {
    on<LoadLoginEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoginLoading()));


      // DataState dataState = await getCountryUseCase('');
      DataState dataState = await loginUseCase.call(event.emailPasswordParams);

      if (dataState is DataSuccess) {
        emit(state.copyWith(newLoginStatus: LoginCompleted()));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(newLoginStatus: LoginError(dataState.message!)));
      }

    });
  }
  
}
