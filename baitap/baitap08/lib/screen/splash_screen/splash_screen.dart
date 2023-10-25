import 'package:baitap08/config/size_config.dart';
import 'package:baitap08/route/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.navigationRoute,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: getHeight(context, height: 0.5),
          width: getWidth(context, width: 0.5),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/splash/splash_img.png")),
          ),
        ),
      ),
    );
  }
}
