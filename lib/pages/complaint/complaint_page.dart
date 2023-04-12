import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/configs/app_colors.dart';
import 'package:task/configs/app_padding.dart';
import 'package:task/models/complaint_type.dart';

import '../complaint-comment/complaint_comment_page.dart';

class ComplaintPage extends StatelessWidget {
  static const String id = "complaint-page";
  ComplaintPage({super.key});

  // #TODO: must come from the backend.
  final name = "Константин";

  // #TODO: can come from the backend.
  final List<ComplaintType> complaintTypes = [
    ComplaintType(
      title: "Спам",
    ),
    ComplaintType(
      title: "Мошенничество",
      description:
          "Отправьте жалобу, если пользователь пытается обмануть вас или получить доступ к вашей личной информации.",
      commentOptional: false,
    ),
    ComplaintType(
      title: "Оскорбления",
      description:
          "Отправьте жалобу, если пользователь оскорбляет вас или других пользователей.",
    ),
    ComplaintType(title: "Откровенное изображение"),
    ComplaintType(title: "Проблема с профилем"),
    ComplaintType(title: "Нарушение интеллектуальных прав"),
    ComplaintType(title: "Прочее"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // #header
            const ComplaintHeaderWidget(),

            const SizedBox(height: 24),

            // #body
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppPaddings.side),
                child: Column(
                  children: [
                    Text(
                      "Что на странице $nameа кажется вам недопустимым?",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    //
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        itemCount: complaintTypes.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            // #navigate to comment page
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        ComplaintCommentPage(
                                  complaintType: complaintTypes[index],
                                ),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                transitionDuration:
                                    const Duration(milliseconds: 200),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(complaintTypes[index].title),
                          ),
                        ),
                      ),
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

class ComplaintHeaderWidget extends StatelessWidget {
  final bool showBackButton;
  const ComplaintHeaderWidget({
    this.showBackButton = false,
    super.key,
  });

  // #TODO: must come from the backend.
  final name = "Константин";
  final surname = "Володарский";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // #button : back
            IconButton(
              onPressed: () {
                if (showBackButton) Navigator.pop(context);
              },
              icon: Icon(showBackButton
                  ? CupertinoIcons.arrow_left
                  : CupertinoIcons.clear),
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
      ],
    );
  }
}
