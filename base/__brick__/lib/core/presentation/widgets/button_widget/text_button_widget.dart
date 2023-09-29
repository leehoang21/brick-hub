import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idolise/core/presentation/widgets/text_widget/style_lable.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../../common/themes/themes.dart';

part 'text_button_widget2.dart';

enum ButtonState { active, inactive }

class TextButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? titleColor;
  final Color? borderColor;
  final String title;
  final double? width;
  final double? height;
  final ButtonState? buttonState;
  final bool? isLoading;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? padding;

  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.buttonState = ButtonState.active,
    this.buttonColor,
    this.titleColor,
    this.borderColor,
    this.height,
    this.width,
    this.prefixIcon,
    this.isLoading = false,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: isLoading != true ? onPressed : null,
        style: TextButton.styleFrom(
          padding: padding,
          backgroundColor: buttonState == ButtonState.active ? buttonColor ?? AppColor.primaryColor : AppColor.grey400,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ?? buttonColor ?? Colors.transparent, // your color here
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.borderButton),
            ),
          ),
          maximumSize: Size.infinite,
          minimumSize: Size(width ?? MediaQuery.of(context).size.width, height ?? AppDimens.buttonSize),
          elevation: 0,
        ),
        child: IntrinsicHeight(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: StyleLabel(
                  title: title.toUpperCase(),
                  style: titleColor != null ? ThemeText.button.copyWith(color: titleColor) : ThemeText.button,
                ),
              ),
              isLoading == true
                  ? const Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: AppColor.white,
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Align(alignment: Alignment.centerLeft, child: prefixIcon ?? const SizedBox()).paddingLeft(24)
            ],
          ),
        ));
  }
}
