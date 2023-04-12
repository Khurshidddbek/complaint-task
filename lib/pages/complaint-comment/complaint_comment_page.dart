import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/models/complaint_type.dart';
import 'package:task/widgets/default_button_widget.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_padding.dart';

class ComplaintCommentPage extends StatefulWidget {
  final ComplaintType complaintType;
  const ComplaintCommentPage({required this.complaintType, super.key});

  @override
  State<ComplaintCommentPage> createState() => _ComplaintCommentPageState();
}

class _ComplaintCommentPageState extends State<ComplaintCommentPage> {
  // #TODO: must come from the backend.
  final name = "Константин";

  final surname = "Володарский";

  final inputController = TextEditingController();

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
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // #complaint title
                        Text(
                          widget.complaintType.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // #complaint description
                        Text(widget.complaintType.description),

                        const SizedBox(height: AppPaddings.side),

                        // #comment option
                        Text(
                          "Комментарий (${widget.complaintType.commentOptional ? "необязательно" : "обязательно"})",
                          style: TextStyle(color: AppColors.greyText),
                        ),

                        const SizedBox(height: AppPaddings.side / 2),

                        // #comment textfield
                        TextField(
                          controller: inputController,
                          decoration: InputDecoration(
                            hintText: "Опишите причину жалобы",
                            hintStyle: TextStyle(color: AppColors.greyText),
                          ),
                          maxLines: 5,
                          onChanged: (value) {
                            if (widget.complaintType.commentOptional == false) {
                              setState(() {});
                            }
                          },
                        ),

                        const SizedBox(height: AppPaddings.side),

                        DefaultButton(
                          onPressed: () {},
                          text: "Отправить жалобу",
                          isActive: widget.complaintType.commentOptional ||
                              inputController.text.isNotEmpty,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
