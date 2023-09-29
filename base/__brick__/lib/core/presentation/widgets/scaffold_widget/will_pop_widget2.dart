import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:idolise/common/utils/utils_src.dart';

class WillPopWidget2 extends StatefulWidget {
  final Widget child;
  const WillPopWidget2({super.key, required this.child});

  @override
  State<WillPopWidget2> createState() => _WillPopWidget2State();
}

class _WillPopWidget2State extends State<WillPopWidget2> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: widget.child,
    );
  }

  Future<bool> _onWillPop() {
    if (context.router.canPop()) {
      context.router.pop();
    } else {
      AppUtils.showToast("Tap again to exits");
    }

    return Future.value(false);
  }
}
