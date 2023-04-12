import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:task/configs/app_colors.dart';
import 'package:task/pages/complaint/complaint_page.dart';

class NavBarPage extends StatefulWidget {
  static const String id = "nav-bar-page";
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  late PersistentTabController navBarController;

  List<Widget> pages = [];

  var pageItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: (""),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.grid_view_outlined),
      title: (""),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.plus),
      title: (""),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.search),
      title: (""),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person_outline_outlined),
      title: (""),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];

  @override
  void initState() {
    super.initState();

    navBarController = PersistentTabController(initialIndex: 0);
    pages = [
      const Center(child: Text("Home")),
      ComplaintPage(navBarController: navBarController),
      const Center(child: Text("Add Something")),
      const Center(child: Text("Search")),
      const Center(child: Text("Profile")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: navBarController,
        screens: pages,
        items: pageItems,
        navBarStyle: NavBarStyle.style12,
        backgroundColor: Colors.grey[50]!,
        decoration: NavBarDecoration(
          border: Border.all(color: AppColors.grey),
        ),
      ),
    );
  }
}
