import 'package:flutter/material.dart';

import '../../../../common/constants/layout_constants.dart';
import '../../../../themes/themes.dart';

class ScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appbar;
  final Widget body;
  final Color backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? backgroundImage;

  const ScaffoldWidget({
    Key? key,
    required this.body,
    this.appbar,
    this.backgroundColor = Colors.white,
    this.bottomNavigationBar,
    this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              // left: 0,
              // right: 0,
              bottom: 0,
              child: backgroundImage ?? Container(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstants.paddingHorizontalApp)
                  .copyWith(bottom: LayoutConstants.paddingVerticalApp),
              child: body,
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
