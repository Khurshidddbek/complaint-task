import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/configs/app_padding.dart';

import '../configs/app_colors.dart';

class DefaultButton extends StatefulWidget {
  /// default state: [Actvie]
  final bool isActive;

  final void Function()? onPressed;
  final String text;

  /// default color: [AppColors.primery]
  final Color? backgroundColor;

  /// default text color: [Colors.white],
  final Color? textColor;

  /// Margin around the button
  final EdgeInsetsGeometry margin;

  /// default color: [Colors.white],
  final Color? suffixIconColor;

  /// default border color: [null],
  final Color? borderColor;

  const DefaultButton({
    required this.onPressed,
    required this.text,
    this.isActive = true,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.margin = const EdgeInsets.all(0),
    this.suffixIconColor,
    Key? key,
  }) : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: Container(
          key: ValueKey(widget.isActive),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: widget.borderColor,
          ),
          padding: widget.borderColor == null
              ? EdgeInsets.zero
              : const EdgeInsets.all(1),
          child: CupertinoButton(
            onPressed: widget.isActive ? widget.onPressed : null,
            borderRadius: BorderRadius.circular(4),
            color: widget.backgroundColor ?? AppColors.activeButton,
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.side),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color:
                        widget.isActive ? widget.textColor : AppColors.greyText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
