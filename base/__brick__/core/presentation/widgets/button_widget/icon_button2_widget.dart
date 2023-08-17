// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'button_constants.dart';

class IconButtonWidget2 extends StatelessWidget {
  final Function() onPressed;
  final dynamic iconSource;
  final Color? iconColor;
  final double? size;
  final bool enabled;
  const IconButtonWidget2({
    Key? key,
    required this.onPressed,
    required this.iconSource,
    this.iconColor,
    this.size,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled ? onPressed : null,
      icon: iconSource is IconData
          ? Icon(
              iconSource!,
              size: size ?? ButtonConstants.iconSize,
              color: iconColor ??
                  (enabled
                      ? ButtonConstants.iconColor
                      : ButtonConstants.iconColorUnenabled),
            )
          : SvgPicture.asset(
              iconSource,
              height: size ?? ButtonConstants.iconSize,
              color: iconColor ??
                  (enabled
                      ? ButtonConstants.iconColor
                      : ButtonConstants.iconColorUnenabled),
            ),
    );
  }
}
