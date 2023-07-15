import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:samim/features/authentication/login/presentation/screens/login_screen.dart';
import 'package:samim/features/country/presentation/screens/country_screen.dart';


enum Routes {
  root("/"),

  // Auth Page
  login("/login"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        builder: (_, __) => const CountryScreen(),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const LoginScreen(),
      ),
    ],
    initialLocation: Routes.login.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
  );
}
