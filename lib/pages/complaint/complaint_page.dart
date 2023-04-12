import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/configs/app_colors.dart';
import 'package:task/configs/app_padding.dart';
import 'package:task/models/complaint_type.dart';

class ComplaintPage extends StatelessWidget {
  ComplaintPage({super.key});

  // #TODO: must come from the backend.
  final name = "Константин";
  final surname = "Володарский";

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
            Stack(
              children: [
                // #button : back
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.clear),
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
                          onTap: () {},
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
