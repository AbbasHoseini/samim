import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:samim/core/app_route.dart';
import 'package:samim/features/authentication/login/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samim/features/country/presentation/bloc/country_bloc.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //   // Set preferred orientations
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp, // Allow only portrait orientation
  // ]);

  ///  init locator
  await setup();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    builder: FToastBuilder(),
    theme: ThemeData(
      // primarySwatch: Colors.blue,
      fontFamily: 'Yekan',
      // textTheme: TextTheme(
      //   bodyText1: TextStyle(fontSize: fontParagraph1),
      // ),
    ),
    home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<HomeBloc>()),
          BlocProvider(create: (_) => locator<CountryBloc>()),
        ],
        child: MaterialApp.router(
          routerConfig: AppRoute.router,
        )),
  ));
}
