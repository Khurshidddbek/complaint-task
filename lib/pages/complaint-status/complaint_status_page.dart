import 'package:flutter/material.dart';
import 'package:task/configs/app_assets.dart';
import 'package:task/widgets/default_button_widget.dart';

import '../../configs/app_padding.dart';
import '../complaint/complaint_page.dart';

class ComplaintStatusPage extends StatelessWidget {
  static const String id = "complaint-status-page";

  /// true: Модераторы скоро рассмотрят вашу жалобу.
  /// false: Пожалуйста, попробуйте еще раз позже.
  final bool success;
  const ComplaintStatusPage({required this.success, super.key});

  // #TODO: must come from the backend.
  final name = "Константин";
  final surname = "Володарский";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // #header
            const ComplaintHeaderWidget(showBackButton: true),

            const SizedBox(height: 24),

            // #body
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppPaddings.side),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      success
                          ? AppAssets.icons.checkSuccess
                          : AppAssets.icons.checkFail,
                      height: 64,
                      width: 64,
                    ),

                    const SizedBox(height: 24),

                    //
                    Text(
                      success ? "Спасибо!" : "Пожалуйста",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(success
                        ? "Модераторы скоро рассмотрят вашу жалобу."
                        : "Попробуйте еще раз позже"),

                    const SizedBox(height: 24),

                    DefaultButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: "Закрыть",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
