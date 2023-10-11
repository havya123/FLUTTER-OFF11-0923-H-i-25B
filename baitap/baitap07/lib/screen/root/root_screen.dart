import 'package:baitap07/provider/login_provider.dart';
import 'package:baitap07/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, value, child) {
        Future.delayed(const Duration(seconds: 2), () {
          if (value.isLogin) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.navigationScreen,
              (route) => false,
            );
          } else {
            Navigator.pushNamed(context, RoutesName.loginScreen);
          }
        });
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
