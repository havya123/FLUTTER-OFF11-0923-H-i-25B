import 'package:baitap07/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<LoginProvider>().isLog();
              // Navigator.pushReplacementNamed(
              //     context, RoutesName.navigationScreen);
            },
            child: const Text("Login Screen")),
      ),
    );
  }
}
