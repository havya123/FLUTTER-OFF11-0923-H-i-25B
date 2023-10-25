import 'package:baitap08/provider/movie_provider.dart';
import 'package:baitap08/route/route_manager.dart';
import 'package:baitap08/route/routes.dart';
import 'package:baitap08/screen/home_screen/home_screen.dart';
import 'package:baitap08/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.navigationRoute,
          onGenerateRoute: RouteManager.routeManager,
          theme: ThemeApp.themeApp,
        );
      },
    );
  }
}
