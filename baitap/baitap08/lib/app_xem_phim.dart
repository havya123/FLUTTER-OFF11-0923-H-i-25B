import 'package:baitap08/provider/caster_provider.dart';
import 'package:baitap08/provider/favourite_provider.dart';
import 'package:baitap08/provider/movie_provider.dart';
import 'package:baitap08/provider/review_provider.dart';
import 'package:baitap08/provider/search_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieProvider()),
        ChangeNotifierProvider(
          create: (context) => ReviewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CasterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(create: (context) => FavouriteProvider())
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.splashRoute,
          onGenerateRoute: RouteManager.routeManager,
          theme: ThemeApp.themeApp,
        );
      },
    );
  }
}
