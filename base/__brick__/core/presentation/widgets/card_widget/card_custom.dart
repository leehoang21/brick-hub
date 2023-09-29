import 'package:flutter/material.dart';
import 'package:idolise/common/constants/app_dimens.dart';
import 'package:idolise/common/themes/themes.dart';

class CardCustom extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  const CardCustom({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppDimens.borderSmall),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 8,
              color: AppColor.black.withOpacity(0.1),
            )
          ]),
      child: SizedBox(
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
