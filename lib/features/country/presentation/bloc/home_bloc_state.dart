part of 'home_bloc.dart';

// abstract class HomeBlocState extends Equatable {
//   const HomeBlocState();

//   @override
//   List<Object> get props => [];
// }

// class HomeBlocInitial extends HomeBlocState {}

class HomeBlocState {
  LoginStatus loginStatus;
  HomeBlocState({required this.loginStatus});

  HomeBlocState copyWith({LoginStatus? newLoginStatus}) {
    return HomeBlocState(loginStatus: newLoginStatus ?? this.loginStatus);
  }
}
