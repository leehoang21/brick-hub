import 'package:flutter/material.dart';

class MeasureSize extends StatefulWidget {
  const MeasureSize({
    super.key,
    required this.onChange,
    required this.child,
  });
  final Function(Size size) onChange;
  final Widget child;

  @override
  State<MeasureSize> createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_key.currentContext != null &&
          mounted &&
          _key.currentContext!.size != null) {
        widget.onChange(_key.currentContext!.size!);
      }
    });
    super.initState();
  }

  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: widget.child,
    );
  }
}
