import 'dart:io';
import 'package:baitap07/provider/category_news_provider.dart';
import 'package:baitap07/provider/category_provider.dart';
import 'package:baitap07/provider/login_provider.dart';
import 'package:baitap07/routes/route_mangager.dart';
import 'package:baitap07/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
            create: (context) => CategoryProvider()..loadData()),
        ChangeNotifierProvider(create: (context) => CateNewsProvider())
      ],
      builder: (context, child) {
        return const MaterialApp(
          initialRoute: RoutesName.navigationScreen,
          onGenerateRoute: RouteManager.onGeneratedRoute,
        );
      },
    );
  }
}
