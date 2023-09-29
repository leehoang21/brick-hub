import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idolise/common/utils/utils_src.dart';

class WillPopWidget extends StatefulWidget {
  final Widget child;
  const WillPopWidget({super.key, required this.child});

  @override
  State<WillPopWidget> createState() => _WillPopWidgetState();
}

class _WillPopWidgetState extends State<WillPopWidget> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _onWillPop, child: widget.child);
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      AppUtils.showToast("Tap again to exits");
    } else {
      SystemNavigator.pop();
    }
    return Future.value(false);
  }
}
