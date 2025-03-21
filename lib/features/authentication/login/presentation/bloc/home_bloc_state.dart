part of 'home_bloc.dart';

// abstract class HomeBlocState extends Equatable {
//   const HomeBlocState();

//   @override
//   List<Object> get props => [];
// }

// class HomeBlocInitial extends HomeBlocState {}

class HomeBlocState {
  LoginStatus loginStatus;
  String message;
  HomeBlocState({required this.loginStatus, required this.message});

  HomeBlocState copyWith({LoginStatus? newLoginStatus, String? message}) {
    return HomeBlocState(
        loginStatus: newLoginStatus ?? loginStatus, message: this.message);
  }
}
