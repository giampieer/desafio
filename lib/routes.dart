import 'package:desafio/modules/home/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static GoRouter goRouter = GoRouter(
      routes: <GoRoute>[
        ///URL DEFAULT
        GoRoute(
          path: '/login-screen',
          builder: (BuildContext context, GoRouterState state) =>
              const LoginScreen(),
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        bool redirect = false;
        switch (state.subloc) {
          case '/login-screen':
            redirect = false;
            break;
          default:
            redirect = true;
        }
        return redirect ? '/login-screen' : null;
      });
}
