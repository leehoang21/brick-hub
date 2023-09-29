// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idolise/common/constants/app_dimens.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/themes/themes.dart';
import 'appbar_constants.dart';

class AppBarButton extends StatelessWidget {
  final Widget? child;
  final String? iconSource;
  final Color? iconColor;
  final Function()? onTap;
  final double? width;
  final double? height;

  const AppBarButton({
    Key? key,
    this.child,
    this.iconSource,
    this.onTap,
    this.width,
    this.height,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppbarConstants.buttonSize,
      width: AppbarConstants.buttonSize,
      child: InkWell(
        onTap: onTap,
        child: child ??
            Center(
              child: SvgPicture.asset(
                iconSource!,
                color: iconColor ?? Colors.white,
                width: width ?? AppbarConstants.buttonIconSize,
                height: height ?? AppbarConstants.buttonIconSize,
              ),
            ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final bool isLeading;
  final VoidCallback? onLeadingTap;
  final String? title;
  final bool centerTitle;
  final Widget? trailing;

  const AppBarWidget({
    super.key,
    this.isLeading = true,
    this.onLeadingTap,
    this.title,
    this.centerTitle = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(top: top),
      decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          border: const Border(bottom: BorderSide(color: AppColor.grey400))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (isLeading)
                SizedBox(
                  width: AppbarConstants.buttonSize,
                  height: AppbarConstants.buttonSize,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: AppDimens.iconSize,
                  ).onTap(
                    onLeadingTap ?? () => context.pop(),
                  ),
                ),
              Expanded(
                child: Text(
                  title ?? '',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: FontFamily.nordiquePro),
                  textAlign: TextAlign.center,
                ),
              ),
              trailing ??
                  (centerTitle
                      ? SizedBox(
                          width: AppbarConstants.buttonSize,
                          height: AppbarConstants.buttonSize,
                        )
                      : const SizedBox()),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => AppbarConstants.appbarSize;
}
