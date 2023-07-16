
import 'dart:convert';
import 'package:samim/features/country/domain/entities/country_repository_entity.dart';


List<CountryModel> countryEntityFromJson(String str) =>
    List<CountryModel>.from(
        json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryEntityToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel extends CountryEntity {
  const CountryModel({
    capital,
    name,
    nativeName,
    flag,
  }) : super(capital: capital, name: name, nativeName: nativeName, flag: flag);


    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        capital: json["capital"],
        name: json["name"],
        nativeName: json["nativeName"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "capital": capital,
        "name": name,
        "nativeName": nativeName,
        "flag": flag,
      };
}
