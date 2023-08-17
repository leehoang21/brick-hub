import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../themes/themes.dart';
import 'button_constants.dart';

enum ButtonState { active, inactive }

class TextButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color buttonColor;
  final Color? titleColor;
  final String title;
  final double? width;
  final double? height;
  final ButtonState? buttonState;

  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.buttonState = ButtonState.active,
    this.buttonColor = AppColor.buttonColor,
    this.titleColor,
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 12.w,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            buttonState == ButtonState.active ? buttonColor : AppColor.iron),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(ButtonConstants.radiusTextButton),
            ),
          ),
        ),
      ),
      child: Text(
        title,
        style: ThemeText.caption.copyWith(
          fontWeight: FontWeight.bold,
          color: titleColor ?? AppColor.white,
        ),
      ),
    );
  }
}
