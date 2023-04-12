import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/pages/complaint/complaint_page.dart';

import '../../configs/app_colors.dart';

class BottomNavBarPage extends StatefulWidget {
  static const String id = "bottom-nav-bar-page";
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  var bottomNavBarController = CupertinoTabController();

  var pageNames = [
    "Home",
    "",
    "Add something",
    "Search",
    "Profile",
  ];

  var pageIcons = [
    const Icon(CupertinoIcons.home),
    const Icon(CupertinoIcons.rectangle_grid_2x2),
    const Icon(CupertinoIcons.plus),
    const Icon(CupertinoIcons.search),
    const Icon(Icons.person_outline_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        controller: bottomNavBarController,
        tabBar: CupertinoTabBar(
          items: [
            for (var i = 0; i < pageIcons.length; i++)
              BottomNavigationBarItem(
                  icon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: pageIcons[i],
              ))
          ],
          activeColor: AppColors.activeButton,
          inactiveColor: AppColors.greyText,
          iconSize: 24,
          height: 40,
        ),
        tabBuilder: (BuildContext context, index) {
          // #testing
          return index == 1
              ? ComplaintPage()
              : Center(
                  child: Text(pageNames[index]),
                );
        },
      ),
    );
  }
}
