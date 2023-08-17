// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_eglife_ecommerce_admin/themes/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'button_constants.dart';

class IconButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final dynamic iconSource;
  final Color? iconColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double? size;
  final double? iconHeight;
  final bool isCricle;
  final bool enabled;

  const IconButtonWidget({
    Key? key,
    required this.onPressed,
    required this.iconSource,
    this.iconColor,
    this.buttonColor,
    this.borderColor,
    this.size,
    this.iconHeight,
    this.isCricle = true,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: buttonColor ?? AppColor.white,
      shape: isCricle
          ? const CircleBorder()
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ButtonConstants.radiusIconButton,
              ),
            ),
      child: IconButton(
        iconSize: size ?? ButtonConstants.iconSize,
        style: TextButton.styleFrom(
          shape: isCricle
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    ButtonConstants.radiusIconButton,
                  ),
                ),
        ),
        onPressed: enabled ? onPressed : null,
        icon: iconSource is IconData
            ? Icon(iconSource!,
                size: iconHeight ?? ButtonConstants.iconSize,
                color: iconColor ??
                    (enabled
                        ? ButtonConstants.iconColor
                        : ButtonConstants.iconColorUnenabled))
            : SvgPicture.asset(iconSource,
                height: iconHeight ?? ButtonConstants.iconSize,
                color: iconColor ??
                    (enabled
                        ? ButtonConstants.iconColor
                        : ButtonConstants.iconColorUnenabled)),
      ),
    );
  }
}
