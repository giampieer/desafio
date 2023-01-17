import 'package:desafio/core/utils/constants.dart';
import 'package:desafio/provider/global_provider.dart';
import 'package:desafio/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final mGlobalProvider = GlobalProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: mGlobalProvider),
        ],
        child: MaterialApp.router(
          routeInformationParser:
              RouteGenerator.goRouter.routeInformationParser,
          routerDelegate: RouteGenerator.goRouter.routerDelegate,
          title: globalConstants.nameApp,
          debugShowCheckedModeBanner: false,
        ));
  }
}
