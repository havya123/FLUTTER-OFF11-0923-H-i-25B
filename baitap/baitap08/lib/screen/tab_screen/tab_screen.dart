import 'package:baitap08/config/size_config.dart';
import 'package:baitap08/screen/tab_screen/widget/tab.dart';
import 'package:baitap08/theme/theme.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  TabScreen({required this.type, this.widget, super.key});
  List<String> type;
  Widget? widget;
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  TextTheme textTheme = ThemeApp.themeApp.textTheme;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = ThemeApp.themeApp.textTheme;
    return SizedBox(
      height: getHeight(context, height: 0.75),
      child: DefaultTabController(
          initialIndex: 0,
          length: widget.type.length, // Number of tabs
          child: Scaffold(
            body: Column(
              children: [
                TabBar(
                  indicatorColor: const Color(0xff3A3F47),
                  indicatorWeight: 4.0,
                  unselectedLabelStyle: textTheme.titleMedium,
                  labelStyle: textTheme.titleSmall,
                  isScrollable: true,
                  tabs: widget.type.map((tab) => Tab(text: tab)).toList(),
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index; // Update the current tab index
                    });
                  },
                ),
                spaceHeight(context),
                TabWidget(indexTab: _currentIndex)
              ],
            ),
          )),
    );
  }
}
