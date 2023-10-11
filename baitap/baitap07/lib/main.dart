import 'package:baitap07/provider/login_provider.dart';
import 'package:baitap07/routes/route_mangager.dart';
import 'package:baitap07/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      builder: (context, child) {
        return const MaterialApp(
          initialRoute: RoutesName.rootScreen,
          onGenerateRoute: RouteManager.onGeneratedRoute,
        );
      },
    );
  }
}
