import 'package:buoi3/provider/theme.dart';
import 'package:buoi3/order.dart';
import 'package:buoi3/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: themeProvider.lightTheme(context),
            darkTheme: themeProvider.darkTheme(context),
            home: const Order(),
          );
        },
      ),
    );
  }
}
