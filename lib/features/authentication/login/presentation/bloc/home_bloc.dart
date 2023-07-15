import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:samim/core/resources/data_state.dart';
import 'package:samim/features/authentication/login/data/models/email_password_params_model.dart';
import 'package:samim/features/authentication/login/domain/use_cases/login_usecase.dart';
import 'package:samim/features/authentication/login/presentation/bloc/login_status.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

// class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
//   final LoginUseCase loginUseCase;

//   HomeBloc(this.loginUseCase)
//       : super(HomeBlocState(loginStatus: LoginInitial(), message: '')) {
//     on<LoadLoginEvent>((event, emit) async {
//       emit(state.copyWith(newLoginStatus: LoginLoading()));

//       var dataState = await loginUseCase.call(event.emailPasswordParams);
//       debugPrint('dataaaaaa ${dataState.message}');

//       if (dataState is DataSuccess) {
//         emit(state.copyWith(newLoginStatus: LoginCompleted(), message: dataState.message));
//       }

//       if (dataState is DataFailed) {
//         emit(state.copyWith(newLoginStatus: LoginError(dataState.message!)));
//       }
//     });
//   }
// }

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final LoginUseCase loginUseCase;

  HomeBloc(this.loginUseCase)
      : super(HomeBlocState(loginStatus: LoginInitial(), message: '')) {
    on<LoadLoginEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoginLoading()));

      await Future.delayed(Duration(seconds: 3), () async {
        var dataState = await loginUseCase.call(event.emailPasswordParams);
        print('dataaaaaa ${dataState.message}');

        if (dataState is DataSuccess) {
          print('f');
          emit(state.copyWith(newLoginStatus: LoginCompleted()));
        }

        if (dataState is DataFailed) {
          print('h');
          emit(state.copyWith(newLoginStatus: LoginError(dataState.message!)));
        }
      });
    });
  }
}
