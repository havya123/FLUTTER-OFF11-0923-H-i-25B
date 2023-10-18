import 'package:baitap07/screen/navigation/navigation_screne.dart';
import 'package:flutter/material.dart';

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
