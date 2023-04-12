import 'package:flutter/material.dart';
import 'package:task/helper-pages/close_keyboard_view.dart';
import 'package:task/models/complaint_type.dart';
import 'package:task/pages/complaint-status/complaint_status_page.dart';
import 'package:task/pages/complaint/complaint_page.dart';
import 'package:task/widgets/default_button_widget.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_padding.dart';

class ComplaintCommentPage extends StatefulWidget {
  static const String id = "complaint-comment-page";

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
      body: CloseKeyboardView(
        child: SafeArea(
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
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: "Опишите причину жалобы",
                              hintStyle: TextStyle(color: AppColors.greyText),
                            ),
                            maxLines: 5,
                            onChanged: (value) {
                              if (widget.complaintType.commentOptional ==
                                  false) {
                                setState(() {});
                              }
                            },
                          ),

                          const SizedBox(height: AppPaddings.side),

                          DefaultButton(
                            onPressed: () {
                              // TODO: loading animation and status result
                              // #navigate to complaint status page
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const ComplaintStatusPage(success: true),
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
      ),
    );
  }
}
