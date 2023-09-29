// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:idolise/common/constants/app_dimens.dart';
import '../../../../common/themes/themes.dart';

class ScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appbar;
  final Widget body;
  final Alignment? alignmentBody;
  final Color backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? backgroundImage;
  final bool isScroll;
  double? paddingHorizontal;
  double? paddingVertical;

  ScaffoldWidget({
    Key? key,
    required this.body,
    this.appbar,
    this.alignmentBody,
    this.backgroundColor = Colors.white,
    this.bottomNavigationBar,
    this.backgroundImage,
    this.isScroll = true,
    this.paddingHorizontal,
    this.paddingVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: isScroll
          ? SingleChildScrollView(
              child: _body(context),
            )
          : _body(context),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      alignment: alignmentBody ?? Alignment.bottomCenter,
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.of(context).size.width,
            child: backgroundImage ?? Container()),
        backgroundImage != null
            ? Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                color: AppColor.grey900.withOpacity(0.3),
              )
            : const SizedBox(),
        body.paddingSymmetric(
          horizontal: paddingHorizontal ?? AppDimens.paddingHorizontalApp,
          vertical: paddingVertical ?? 0,
        ),
      ],
    );
  }
}
