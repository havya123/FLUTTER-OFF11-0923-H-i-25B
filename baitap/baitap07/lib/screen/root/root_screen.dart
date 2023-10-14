import 'package:baitap07/provider/login_provider.dart';
import 'package:baitap07/routes/routes.dart';
import 'package:baitap07/screen/category/category.dart';
import 'package:baitap07/screen/home/home_screen.dart';
import 'package:baitap07/screen/navigation/navigation_screne.dart';
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
    return const NavigationScreen();
  }
}
