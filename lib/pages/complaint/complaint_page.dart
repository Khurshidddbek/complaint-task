import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:task/configs/app_colors.dart';
import 'package:task/configs/app_padding.dart';
import 'package:task/data-providers/complaint_data.dart';
import 'package:task/models/complaint_type.dart';

import '../complaint-comment/complaint_comment_page.dart';

class ComplaintPage extends StatefulWidget {
  static const String id = "complaint-page";

  final PersistentTabController? navBarController;
  const ComplaintPage({this.navBarController, super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  List<ComplaintType> complaintTypes = [];
  String name = "?";

  @override
  void initState() {
    super.initState();

    var dataProvider = Provider.of<ComplaintData>(context, listen: false);
    complaintTypes = dataProvider.complaintTypes;
    name = dataProvider.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // #header
            ComplaintHeaderWidget(navBarController: widget.navBarController),

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

class ComplaintHeaderWidget extends StatefulWidget {
  final PersistentTabController? navBarController;
  final bool showBackButton;

  const ComplaintHeaderWidget({
    this.navBarController,
    this.showBackButton = false,
    super.key,
  });

  @override
  State<ComplaintHeaderWidget> createState() => _ComplaintHeaderWidgetState();
}

class _ComplaintHeaderWidgetState extends State<ComplaintHeaderWidget> {
  String name = "?";
  String surname = "?";

  @override
  void initState() {
    super.initState();

    var dataProvider = Provider.of<ComplaintData>(context, listen: false);
    name = dataProvider.name;
    surname = dataProvider.surname;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        const SizedBox(height: AppPaddings.side),

        Stack(
          children: [
            // #button : back
            IconButton(
              onPressed: () {
                if (widget.showBackButton) {
                  Navigator.pop(context);
                } else {
                  widget.navBarController?.jumpToTab(0);
                }
              },
              icon: Icon(widget.showBackButton
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
