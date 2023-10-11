import 'package:baitap07/routes/routes.dart';
import 'package:baitap07/screen/article/article_screen.dart';
import 'package:baitap07/screen/category/category.dart';
import 'package:baitap07/screen/home/home_screen.dart';
import 'package:baitap07/screen/login/login_screen.dart';
import 'package:baitap07/screen/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screen/error/error_screen.dart';
import '../screen/navigation/navigation_screne.dart';

class RouteManager {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.rootScreen:
        return pageTransition(const RootScreen());
      case RoutesName.navigationScreen:
        return pageTransition(const NavigationScreen());
      case RoutesName.loginScreen:
        return pageTransition(const LoginScreen());
      case RoutesName.categoryScreen:
        return pageTransition(const CategoryScreen());
      case RoutesName.homeScreen:
        return pageTransition(const Home());
      case RoutesName.articleScreen:
        return pageTransition(const ArticleScreen());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }

  static PageTransition<dynamic> pageTransition(Widget widget) {
    return PageTransition(child: widget, type: PageTransitionType.fade);
  }
}
