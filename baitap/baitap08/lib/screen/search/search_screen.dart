import 'package:baitap08/config/size_config.dart';
import 'package:baitap08/config/widget/textfiled.dart';
import 'package:baitap08/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({this.controller, super.key});

  PersistentTabController? controller;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = ThemeApp.themeApp.textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            spaceHeight(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    controller!.jumpToTab(0);
                  },
                  icon: const Icon(
                    Icons.keyboard_return,
                    size: 20,
                  ),
                  color: Colors.white,
                ),
                Text(
                  "Search",
                  style: textTheme.titleLarge,
                ),
                const Icon(
                  Icons.info_rounded,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
            spaceHeight(context),
            const TextFieldWidget(),
            spaceHeight(context, height: 0.15),
            const Image(
                image: AssetImage("assets/img/search/Search cant be found.png"))
          ],
        ),
      ),
    );
  }
}
