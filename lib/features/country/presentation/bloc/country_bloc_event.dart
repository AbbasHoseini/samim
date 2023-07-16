part of 'country_bloc.dart';

abstract class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();

  @override
  List<Object> get props => [];
}

class LoadCountryEvent extends HomeBlocEvent {
  const LoadCountryEvent();
}
