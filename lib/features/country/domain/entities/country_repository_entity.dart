import 'package:equatable/equatable.dart';
import 'dart:convert';


List<CountryEntity> countryFromJson(String str) =>
    List<CountryEntity>.from(json.decode(str).map((x) => CountryEntity.fromJson(x)));

String countryToJson(List<CountryEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryEntity extends Equatable {
  final String alpha2Code;
  final String alpha3Code;
  final List<String> altSpellings;
  final double? area;
  final List<String> borders;
  final List<String> callingCodes;
  final String capital;
  final List<Currency> currencies;
  final String demonym;
  final String flag;
  final double? gini;
  final List<Language> languages;
  final List<double> latlng;
  final String name;
  final String nativeName;
  final String? numericCode;
  final int population;
  final Region region;
  final List<RegionalBloc>? regionalBlocs;
  final String subregion;
  final List<String> timezones;
  final List<String> topLevelDomain;
  final Translations translations;
  final String? cioc;

  CountryEntity({
    required this.alpha2Code,
    required this.alpha3Code,
    required this.altSpellings,
    this.area,
    required this.borders,
    required this.callingCodes,
    required this.capital,
    required this.currencies,
    required this.demonym,
    required this.flag,
    this.gini,
    required this.languages,
    required this.latlng,
    required this.name,
    required this.nativeName,
    this.numericCode,
    required this.population,
    required this.region,
    this.regionalBlocs,
    required this.subregion,
    required this.timezones,
    required this.topLevelDomain,
    required this.translations,
    this.cioc,
  });

  factory CountryEntity.fromJson(Map<String, dynamic> json) => CountryEntity(
        alpha2Code: json["alpha2Code"],
        alpha3Code: json["alpha3Code"],
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        area: json["area"]?.toDouble(),
        borders: List<String>.from(json["borders"].map((x) => x)),
        callingCodes: List<String>.from(json["callingCodes"].map((x) => x)),
        capital: json["capital"],
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromJson(x))),
        demonym: json["demonym"],
        flag: json["flag"],
        gini: json["gini"]?.toDouble(),
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
        name: json["name"],
        nativeName: json["nativeName"],
        numericCode: json["numericCode"],
        population: json["population"],
        region: regionValues.map[json["region"]]!,
        regionalBlocs: json["regionalBlocs"] == null
            ? []
            : List<RegionalBloc>.from(
                json["regionalBlocs"]!.map((x) => RegionalBloc.fromJson(x))),
        subregion: json["subregion"],
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        topLevelDomain: List<String>.from(json["topLevelDomain"].map((x) => x)),
        translations: Translations.fromJson(json["translations"]),
        cioc: json["cioc"],
      );

  Map<String, dynamic> toJson() => {
        "alpha2Code": alpha2Code,
        "alpha3Code": alpha3Code,
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "area": area,
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "callingCodes": List<dynamic>.from(callingCodes.map((x) => x)),
        "capital": capital,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "demonym": demonym,
        "flag": flag,
        "gini": gini,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "name": name,
        "nativeName": nativeName,
        "numericCode": numericCode,
        "population": population,
        "region": regionValues.reverse[region],
        "regionalBlocs": regionalBlocs == null
            ? []
            : List<dynamic>.from(regionalBlocs!.map((x) => x.toJson())),
        "subregion": subregion,
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "topLevelDomain": List<dynamic>.from(topLevelDomain.map((x) => x)),
        "translations": translations.toJson(),
        "cioc": cioc,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        alpha2Code,
        alpha3Code,
        altSpellings,
        area,
        borders,
        callingCodes,
        capital,
        currencies,
        demonym,
        flag,
        gini,
        languages,
        latlng,
        name,
        nativeName,
        numericCode,
        population,
        region,
        regionalBlocs,
        subregion,
        timezones,
        topLevelDomain,
        translations,
        cioc,
      ];
}

class Currency {
  final String? code;
  final String? name;
  final String? symbol;

  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
      };
}

class Language {
  final String? languageIso6391;
  final String iso6392;
  final String name;
  final String? nativeName;
  final String? iso6391;
  final String? nativName;

  Language({
    this.languageIso6391,
    required this.iso6392,
    required this.name,
    this.nativeName,
    this.iso6391,
    this.nativName,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        languageIso6391: json["iso639_1"],
        iso6392: json["iso639_2"],
        name: json["name"],
        nativeName: json["nativeName"],
        iso6391: json["iso639-1"],
        nativName: json["nativName"],
      );

  Map<String, dynamic> toJson() => {
        "iso639_1": languageIso6391,
        "iso639_2": iso6392,
        "name": name,
        "nativeName": nativeName,
        "iso639-1": iso6391,
        "nativName": nativName,
      };
}

enum Region { ASIA, EUROPE, AFRICA, OCEANIA, AMERICAS, POLAR }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA,
  "Polar": Region.POLAR
});

class RegionalBloc {
  final Acronym acronym;
  final Name name;
  final List<OtherName>? otherNames;
  final List<OtherAcronym>? otherAcronyms;

  RegionalBloc({
    required this.acronym,
    required this.name,
    this.otherNames,
    this.otherAcronyms,
  });

  factory RegionalBloc.fromJson(Map<String, dynamic> json) => RegionalBloc(
        acronym: acronymValues.map[json["acronym"]]!,
        name: nameValues.map[json["name"]]!,
        otherNames: json["otherNames"] == null
            ? []
            : List<OtherName>.from(
                json["otherNames"]!.map((x) => otherNameValues.map[x]!)),
        otherAcronyms: json["otherAcronyms"] == null
            ? []
            : List<OtherAcronym>.from(
                json["otherAcronyms"]!.map((x) => otherAcronymValues.map[x]!)),
      );

  Map<String, dynamic> toJson() => {
        "acronym": acronymValues.reverse[acronym],
        "name": nameValues.reverse[name],
        "otherNames": otherNames == null
            ? []
            : List<dynamic>.from(
                otherNames!.map((x) => otherNameValues.reverse[x])),
        "otherAcronyms": otherAcronyms == null
            ? []
            : List<dynamic>.from(
                otherAcronyms!.map((x) => otherAcronymValues.reverse[x])),
      };
}

enum Acronym {
  SAARC,
  EU,
  CEFTA,
  AU,
  AL,
  CARICOM,
  USAN,
  EEU,
  CAIS,
  ASEAN,
  NAFTA,
  PA,
  EFTA
}

final acronymValues = EnumValues({
  "AL": Acronym.AL,
  "ASEAN": Acronym.ASEAN,
  "AU": Acronym.AU,
  "CAIS": Acronym.CAIS,
  "CARICOM": Acronym.CARICOM,
  "CEFTA": Acronym.CEFTA,
  "EEU": Acronym.EEU,
  "EFTA": Acronym.EFTA,
  "EU": Acronym.EU,
  "NAFTA": Acronym.NAFTA,
  "PA": Acronym.PA,
  "SAARC": Acronym.SAARC,
  "USAN": Acronym.USAN
});

enum Name {
  SOUTH_ASIAN_ASSOCIATION_FOR_REGIONAL_COOPERATION,
  EUROPEAN_UNION,
  CENTRAL_EUROPEAN_FREE_TRADE_AGREEMENT,
  AFRICAN_UNION,
  ARAB_LEAGUE,
  CARIBBEAN_COMMUNITY,
  UNION_OF_SOUTH_AMERICAN_NATIONS,
  EURASIAN_ECONOMIC_UNION,
  CENTRAL_AMERICAN_INTEGRATION_SYSTEM,
  ASSOCIATION_OF_SOUTHEAST_ASIAN_NATIONS,
  NORTH_AMERICAN_FREE_TRADE_AGREEMENT,
  PACIFIC_ALLIANCE,
  EUROPEAN_FREE_TRADE_ASSOCIATION
}

final nameValues = EnumValues({
  "African Union": Name.AFRICAN_UNION,
  "Arab League": Name.ARAB_LEAGUE,
  "Association of Southeast Asian Nations":
      Name.ASSOCIATION_OF_SOUTHEAST_ASIAN_NATIONS,
  "Caribbean Community": Name.CARIBBEAN_COMMUNITY,
  "Central American Integration System":
      Name.CENTRAL_AMERICAN_INTEGRATION_SYSTEM,
  "Central European Free Trade Agreement":
      Name.CENTRAL_EUROPEAN_FREE_TRADE_AGREEMENT,
  "Eurasian Economic Union": Name.EURASIAN_ECONOMIC_UNION,
  "European Free Trade Association": Name.EUROPEAN_FREE_TRADE_ASSOCIATION,
  "European Union": Name.EUROPEAN_UNION,
  "North American Free Trade Agreement":
      Name.NORTH_AMERICAN_FREE_TRADE_AGREEMENT,
  "Pacific Alliance": Name.PACIFIC_ALLIANCE,
  "South Asian Association for Regional Cooperation":
      Name.SOUTH_ASIAN_ASSOCIATION_FOR_REGIONAL_COOPERATION,
  "Union of South American Nations": Name.UNION_OF_SOUTH_AMERICAN_NATIONS
});

enum OtherAcronym { UNASUR, UNASUL, UZAN, EAEU, SICA }

final otherAcronymValues = EnumValues({
  "EAEU": OtherAcronym.EAEU,
  "SICA": OtherAcronym.SICA,
  "UNASUL": OtherAcronym.UNASUL,
  "UNASUR": OtherAcronym.UNASUR,
  "UZAN": OtherAcronym.UZAN
});

enum OtherName {
  EMPTY,
  UNION_AFRICAINE,
  UNIO_AFRICANA,
  UNIN_AFRICANA,
  UMOJA_WA_AFRIKA,
  OTHER_NAME,
  JMI_AT_AD_DUWAL_AL_ARABYAH,
  LEAGUE_OF_ARAB_STATES,
  COMUNIDAD_DEL_CARIBE,
  COMMUNAUT_CARIBENNE,
  CARIBISCHE_GEMEENSCHAP,
  UNIN_DE_NACIONES_SURAMERICANAS,
  UNIO_DE_NAES_SUL_AMERICANAS,
  UNIE_VAN_ZUID_AMERIKAANSE_NATIES,
  SOUTH_AMERICAN_UNION,
  SISTEMA_DE_LA_INTEGRACIN_CENTROAMERICANA,
  TRATADO_DE_LIBRE_COMERCIO_DE_AMRICA_DEL_NORTE,
  ACCORD_DE_LIBRE_CHANGE_NORD_AMRICAIN,
  ALIANZA_DEL_PACFICO
}

final otherNameValues = EnumValues({
  "Accord de Libre-échange Nord-Américain":
      OtherName.ACCORD_DE_LIBRE_CHANGE_NORD_AMRICAIN,
  "Alianza del Pacífico": OtherName.ALIANZA_DEL_PACFICO,
  "Caribische Gemeenschap": OtherName.CARIBISCHE_GEMEENSCHAP,
  "Communauté Caribéenne": OtherName.COMMUNAUT_CARIBENNE,
  "Comunidad del Caribe": OtherName.COMUNIDAD_DEL_CARIBE,
  "الاتحاد الأفريقي": OtherName.EMPTY,
  "Jāmiʻat ad-Duwal al-ʻArabīyah": OtherName.JMI_AT_AD_DUWAL_AL_ARABYAH,
  "League of Arab States": OtherName.LEAGUE_OF_ARAB_STATES,
  "جامعة الدول العربية": OtherName.OTHER_NAME,
  "Sistema de la Integración Centroamericana,":
      OtherName.SISTEMA_DE_LA_INTEGRACIN_CENTROAMERICANA,
  "South American Union": OtherName.SOUTH_AMERICAN_UNION,
  "Tratado de Libre Comercio de América del Norte":
      OtherName.TRATADO_DE_LIBRE_COMERCIO_DE_AMRICA_DEL_NORTE,
  "Umoja wa Afrika": OtherName.UMOJA_WA_AFRIKA,
  "Unie van Zuid-Amerikaanse Naties":
      OtherName.UNIE_VAN_ZUID_AMERIKAANSE_NATIES,
  "Unión Africana": OtherName.UNIN_AFRICANA,
  "Unión de Naciones Suramericanas": OtherName.UNIN_DE_NACIONES_SURAMERICANAS,
  "Union africaine": OtherName.UNION_AFRICAINE,
  "União Africana": OtherName.UNIO_AFRICANA,
  "União de Nações Sul-Americanas": OtherName.UNIO_DE_NAES_SUL_AMERICANAS
});

class Translations {
  final String br;
  final String de;
  final String es;
  final String fa;
  final String fr;
  final String hr;
  final String it;
  final String ja;
  final String nl;
  final String pt;
  final String ru;
  final String pl;
  final String cs;
  final String zh;
  final String hu;
  final String se;

  Translations({
    required this.br,
    required this.de,
    required this.es,
    required this.fa,
    required this.fr,
    required this.hr,
    required this.it,
    required this.ja,
    required this.nl,
    required this.pt,
    required this.ru,
    required this.pl,
    required this.cs,
    required this.zh,
    required this.hu,
    required this.se,
  });

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        br: json["br"],
        de: json["de"],
        es: json["es"],
        fa: json["fa"],
        fr: json["fr"],
        hr: json["hr"],
        it: json["it"],
        ja: json["ja"],
        nl: json["nl"],
        pt: json["pt"],
        ru: json["ru"],
        pl: json["pl"],
        cs: json["cs"],
        zh: json["zh"],
        hu: json["hu"],
        se: json["se"],
      );

  Map<String, dynamic> toJson() => {
        "br": br,
        "de": de,
        "es": es,
        "fa": fa,
        "fr": fr,
        "hr": hr,
        "it": it,
        "ja": ja,
        "nl": nl,
        "pt": pt,
        "ru": ru,
        "pl": pl,
        "cs": cs,
        "zh": zh,
        "hu": hu,
        "se": se,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
