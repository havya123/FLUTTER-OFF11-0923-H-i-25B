import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../routes/route_mangager.dart';
import '../category/category.dart';
import '../home/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _HomeState();
}

class _HomeState extends State<NavigationScreen> {
  List<Widget> widgets = [
    const Home(),
    const CategoryScreen(),
  ];

  final List<PersistentBottomNavBarItem> _barItem = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: RouteManager.onGeneratedRoute),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.date_range),
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: RouteManager.onGeneratedRoute),
    ),
  ];

  final PersistentTabController _controller = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: widgets,
      items: _barItem,
      controller: _controller,
      decoration: NavBarDecoration(border: Border.all(width: 1)),
    );
  }
}
