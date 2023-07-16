
import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String? capital;
  final String? name;
  final String? nativeName;
  final String? flag;

  const CountryEntity({
    this.capital,
    this.name,
    this.nativeName,
    this.flag,
  });

  @override
  List<Object?> get props => [capital, name, nativeName, flag];
}
