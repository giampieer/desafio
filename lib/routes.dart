import 'package:desafio/modules/file_manager/presentation/screens/gallery/full_image.dart';
import 'package:desafio/modules/file_manager/presentation/screens/gallery/gallery_screen.dart';
import 'package:desafio/modules/file_manager/presentation/screens/upload/upload_screen.dart';
import 'package:desafio/modules/home/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static GoRouter goRouter = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/login-screen',
          builder: (BuildContext context, GoRouterState state) => LoginScreen(),
        ),
        GoRoute(
          path: '/upload-screen',
          builder: (BuildContext context, GoRouterState state) =>
              UploadScreen(),
        ),
        GoRoute(
          path: '/gallery-screen',
          builder: (BuildContext context, GoRouterState state) =>
              GalleryScreen(),
        ),
        GoRoute(
          path: '/full-image-screen',
          builder: (BuildContext context, GoRouterState state) =>
              FullImageScreen(url: state.extra as String),
          redirect: (BuildContext context, GoRouterState state) {
            return null;
          },
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        bool redirect = false;
        print('---------${state.subloc}');
        switch (state.subloc) {
          case '/login-screen':
            redirect = false;
            break;
          case '/upload-screen':
            redirect = false;
            break;
          case '/gallery-screen':
            redirect = false;
            break;
          case '/full-image-screen':
            redirect = false;
            break;
          default:
            redirect = true;
        }
        return redirect ? '/login-screen' : null;
      });
}
