import 'package:elecciones_sena/provider/categoriasFromProvider.dart';
import 'package:elecciones_sena/provider/categoriasProvider.dart';
import 'package:elecciones_sena/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/AllApi.dart';
import 'construcion_page.dart';

import 'notificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AllApi.configuteDio();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: (_) => CategoriasProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => CategoriasFromProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COIN',
      initialRoute: 'home',
      routes: getRutas(),
      scaffoldMessengerKey: NotificationService.msnKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => Construccion());
      },
    );
  }
}
