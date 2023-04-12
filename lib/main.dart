import 'package:flutter/material.dart';
import 'package:task/pages/complaint/complaint_page.dart';

import 'configs/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      theme: AppThemes.lightAppTheme,
      home: ComplaintPage(),

      /// to avoid changing the textscale-related part of the user's settings
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
