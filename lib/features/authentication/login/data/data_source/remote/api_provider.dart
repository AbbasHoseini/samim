import 'package:dio/dio.dart';
import 'package:samim/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> getCountries() async {
    var response = await _dio.get(
      '${Constants.baseUrl}/esmaeil-ahmadipour/restcountries/main/json/countriesV2.json',
      // queryParameters: {
      //   'q' : cityName,
      //   'appid' : apiKey,
      //   'units' : 'metric'
      // }
    );
    print('ddddddd ${response.statusCode}');
    return response;
  }
}
