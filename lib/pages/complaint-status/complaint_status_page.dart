import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/configs/app_assets.dart';
import 'package:task/widgets/default_button_widget.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_padding.dart';

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
            Stack(
              children: [
                // #button : back
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.arrow_left),
                ),

                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.grey,
                        child: Text(
                          name.isNotEmpty ? name[0] : "?",
                          style: TextStyle(
                            fontSize: 32,
                            color: AppColors.black,
                            fontStyle: GoogleFonts.nunito().fontStyle,
                          ),
                        ),
                      ),

                      const SizedBox(height: AppPaddings.side),

                      // #username
                      Text(
                        "$name $surname",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppPaddings.side),

            const Divider(
              thickness: 1,
              height: 1,
            ),

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
