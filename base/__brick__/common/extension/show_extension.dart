import 'package:flutter/material.dart';
import 'package:idolise/common/constants/app_dimens.dart';
import 'package:idolise/common/extension/translate_extension.dart';
import 'package:idolise/core/presentation/widgets/dialog_widget/dialogs_wiget.dart';
import 'package:nb_utils/nb_utils.dart' as nb_utils;
import '../../core/presentation/widgets/widgets.dart';
import '../themes/themes.dart';

extension ShowExtensionContext on BuildContext {
  void showSnackbar({
    SnackBarType type = SnackBarType.error,
    String? translationKey,
  }) {
    TopSnackBar(
      title: (translationKey ?? '').tr,
      type: type,
    ).show(this);
  }

  Future<void> showDialog({
    bool barrierDismissible = true,
    required Widget child,
  }) async {
    await showGeneralDialog(
      barrierLabel: '',
      context: this,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (cxt, __, ___) {
        return child;
      },
      transitionBuilder: (cxt, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: Align(
              alignment: Alignment.center,
              child: IntrinsicHeight(
                child: child,
              ),
            ),
          ),
        );
      },
    );
    return;
  }

  Future<T?> showAlertDialog<T>({
    DialogType type = DialogType.announce,
    String? title,
    String? message,
    String? buttonTitle,
    VoidCallback? acceptAction,
    VoidCallback? denyAction,
  }) async {
    return DialogWidget(
      context: this,
      type: type,
      title: title,
      message: message,
      buttonTitle: buttonTitle,
      acceptAction: acceptAction,
      denyAction: denyAction,
    ).showAlertDialog<T>();
  }

  Future<dynamic> showBottomSheet({required Widget child, String? title, double? height}) async {
    return await showModalBottomSheet(
      isScrollControlled: true,
      context: this,
      barrierColor: Colors.black.withOpacity(0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimens.borderSmall),
          topRight: Radius.circular(AppDimens.borderSmall),
        ),
      ),
      backgroundColor: Theme.of(this).cardColor,
      builder: (BuildContext context) {
        return SizedBox(
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: title != null,
                child: Column(
                  children: [
                    StyleLabel(
                        title: title ?? "",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontType.bold,
                            )).paddingSymmetric(vertical: AppDimens.paddingSmall),
                    const Divider(color: AppColor.grey400, height: 0)
                  ],
                ),
              ),
              child,
            ],
          ),
        );
      },
    );
  }
}
