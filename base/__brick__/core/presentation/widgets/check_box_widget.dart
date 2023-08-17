import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
    required this.onChanged,
    this.value = false,
    this.isCricle = false,
  });
  final void Function(bool) onChanged;
  final bool value;
  final bool isCricle;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool value = false;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: widget.isCricle == true
          ? const CircleBorder()
          : const RoundedRectangleBorder(),
      value: value,
      onChanged: (value) {
        widget.onChanged(value == true);
        setState(() {
          this.value = value!;
        });
      },
    );
  }
}
