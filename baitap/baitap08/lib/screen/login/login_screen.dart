import 'package:baitap08/config/size_config.dart';
import 'package:baitap08/config/widget/button.dart';
import 'package:baitap08/config/widget/textfiled.dart';
import 'package:baitap08/provider/favourite_provider.dart';
import 'package:baitap08/route/routes.dart';
import 'package:baitap08/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = ThemeApp.themeApp.textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getHeight(context, height: 0.3),
                width: getWidth(context, width: 0.3),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/splash/splash_img.png")),
                ),
              ),
              spaceHeight(context),
              Text(
                "Login",
                style: textTheme.titleLarge,
              ),
              spaceHeight(context),
              TextFieldWidget(
                hint: 'Username',
              ),
              spaceHeight(context),
              TextFieldWidget(
                hint: 'Password',
              ),
              spaceHeight(context, height: 0.06),
              ButtonWidget(
                function: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteName.navigationRoute, (route) => false);
                  context.read<FavouriteProvider>().loadListId();
                },
                textButton: "Login",
              )
            ],
          ),
        ),
      ),
    );
  }
}
