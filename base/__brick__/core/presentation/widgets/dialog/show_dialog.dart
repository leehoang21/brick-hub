import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_eglife_ecommerce/core/presentation/widgets/dialog/flash.dart';

Future<void> showDialogFuntion(
  BuildContext context, {
  bool barrierDismissible = true,
  required Widget Function(BuildContext context, FlashController controller)
      builder,
}) async {
  showFlash(
    context: context,
    builder: (_, controller) {
      return Flash.dialog(
        controller: controller,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        barrierDismissible: true,
        child: Material(
          type: MaterialType.transparency,
          child: builder(_, controller),
        ),
      );
    },
  );
}
