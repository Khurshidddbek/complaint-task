import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/data-providers/complaint_data.dart';
import 'package:task/models/complaint_type.dart';
import 'package:task/pages/complaint-comment/complaint_comment_page.dart';
import 'package:task/pages/complaint-status/complaint_status_page.dart';
import 'package:task/pages/complaint/complaint_page.dart';
import 'package:task/pages/nav-bar/nav_bar_page.dart';

import 'configs/app_themes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ComplaintData(),
      child: MaterialApp(
        title: 'Flutter Task',
        theme: AppThemes.lightAppTheme,

        /// to avoid changing the textscale-related part of the user's settings
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },

        // route settings
        initialRoute: NavBarPage.id,
        routes: {
          NavBarPage.id: (context) => const NavBarPage(),
          ComplaintPage.id: (context) => ComplaintPage(),
          ComplaintCommentPage.id: (context) =>
              ComplaintCommentPage(complaintType: ComplaintType(title: "")),
          ComplaintStatusPage.id: (context) =>
              const ComplaintStatusPage(success: true),
        },
      ),
    );
  }
}
