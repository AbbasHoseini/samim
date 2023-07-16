
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:samim/core/utils/constants.dart';
import 'package:test/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line

  late Dio dio;
  late DioAdapter dioAdapter;
  // RemoteApiProvider remoteApiProvider;

  Response<dynamic> response;

  group('group1', () {
    const baseUrl = 'https://example.com';

    // const userCredentials = <String, dynamic>{
    //   'email': 'test@example.com',
    //   'password': 'password',
    // };

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(
        dio: dio,

        // [FullHttpRequestMatcher] is a default matcher class
        // (which actually means you haven't to pass it manually) that matches entire URL.
        //
        // Use [UrlRequestMatcher] for matching request based on the path of the URL.
        //
        // Or create your own http-request matcher via extending your class from  [HttpRequestMatcher].
        // See -> issue:[124] & pr:[125]
        matcher: const FullHttpRequestMatcher(),
      );
    });

    test('get countries ', () async {
      const route =
          '${Constants.baseUrl}/esmaeil-ahmadipour/restcountries/main/json/countriesV2.json';

      final String jsonData = await rootBundle
          .loadString('test/features/country/data/repository/response.json');
      final List<dynamic> jsonList = json.decode(jsonData);
      // print('type of this ${jsonList.runtimeType}');

      dioAdapter.onGet(
        route,
        (server) => server.reply(
          200,
          jsonList,
          // Adds one-sec delay to reply method.
          // Basically, I'd wait for one second before returning reply data.
          // See -> issue:[106] & pr:[126]
          delay: const Duration(seconds: 1),
        ),
      );

      response = await dio.get(route);

      expect(response.statusCode, 200);
      expect(response.data, jsonList);
      expect(response.data, isA<List<dynamic>>());
    });
  });
}
