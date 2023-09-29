import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:idolise/common/constants/app_dimens.dart';

import '../widgets.dart';
import '../../../../common/themes/themes.dart';

enum DialogType { announce, option }

class DialogWidget extends StatelessWidget {
  final BuildContext context;
  final DialogType type;
  final String? title;
  final String? message;
  final String? buttonTitle;
  final VoidCallback? acceptAction;
  final VoidCallback? denyAction;

  const DialogWidget({
    Key? key,
    required this.context,
    required this.type,
    this.title,
    this.message,
    this.buttonTitle,
    this.acceptAction,
    this.denyAction,
  }) : super(key: key);

  Future<T?> showAlertDialog<T>() {
    return showGeneralDialog<T>(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: AppColor.textColor.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return this;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget inforWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StyleLabel(
          title: title ?? 'title',
          style: ThemeText.body,
        ).paddingSymmetric(vertical: AppDimens.paddingSmall),
        StyleLabel(
          title: message ?? "message",
          textAlign: TextAlign.center,
          style: ThemeText.caption.copyWith(color: AppColor.textColor),
          maxLines: 5,
        ),
      ],
    );

    Widget actionWidget = type == DialogType.announce
        ? TextButtonWidget(
            onPressed: () {
              context.pop();
              acceptAction?.call();
            },
            title: buttonTitle ?? "OK",
          ).paddingSymmetric(vertical: AppDimens.paddingSmall)
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButtonWidget(
                onPressed: () {
                  context.pop();
                  acceptAction?.call();
                },
                title: buttonTitle ?? "OK",
              ).paddingSymmetric(vertical: AppDimens.paddingSmall),
              TextButtonWidget(
                onPressed: () {
                  denyAction == null ? context.pop() : denyAction?.call();
                },
                title: "No, thanks",
                buttonColor: AppColor.grey800,
                titleColor: AppColor.textColor,
                borderColor: AppColor.grey800,
              ),
            ],
          );

    return Align(
      alignment: Alignment.center,
      child: IntrinsicHeight(
        child: Center(
          child: Container(
              padding: EdgeInsets.all(AppDimens.paddingHorizontalApp),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.white,
              ),
              child: Material(
                color: AppColor.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [inforWidget, actionWidget],
                ),
              )),
        ),
      ),
    );
  }
}
