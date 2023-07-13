part of 'home_bloc.dart';

abstract class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();

  @override
  List<Object> get props => [];
}

class LoadLoginEvent extends HomeBlocEvent {}
