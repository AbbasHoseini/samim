import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:samim/core/app_route.dart';
import 'package:samim/features/authentication/login/presentation/bloc/home_bloc.dart';
import 'package:samim/features/authentication/login/presentation/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///  init locator
  await setup();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    builder: FToastBuilder(),
    home: MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>locator<HomeBloc>()),
    ], child: MaterialApp.router(
      routerConfig: AppRoute.router,
    )),
  ));
}
