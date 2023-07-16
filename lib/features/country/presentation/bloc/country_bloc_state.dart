part of 'country_bloc.dart';

// abstract class HomeBlocState extends Equatable {
//   const HomeBlocState();

//   @override
//   List<Object> get props => [];
// }

// class HomeBlocInitial extends HomeBlocState {}

class CountryBlocState {
  CountryStatus countryStatus;
  CountryBlocState({required this.countryStatus});

  CountryBlocState copyWith({CountryStatus? newCountryStatus}) {
    return CountryBlocState(countryStatus: newCountryStatus ?? this.countryStatus);
  }
}
