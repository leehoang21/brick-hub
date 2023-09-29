import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../../common/constants/string_constants.dart';
import '../../../../common/themes/themes.dart';
import '../../../../common/utils/utils_src.dart';
import '../widgets.dart';

class TextFieldCustom extends StatelessWidget {
  final String? label;
  final String? hintText;
  final IconData? prefixIcon;
  final String? Function(String?)? validate;
  final bool? isRequired;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool? isSecure;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final TextStyle? errorStyle;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  const TextFieldCustom(
      {super.key,
      this.label,
      this.isRequired,
      this.hintText,
      this.prefixIcon,
      this.validate,
      this.isSecure,
      this.focusNode,
      this.fillColor,
      this.labelStyle,
      this.errorStyle,
      this.textInputAction,
      this.textStyle,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: StyleLabel(
            title: label ?? "",
            style: labelStyle ??
                Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontType.bold,
                    ),
          ),
        ).paddingBottom(AppDimens.paddingSmall),
        TextFieldWidget(
          controller: controller ?? TextEditingController(),
          prefixIcon: prefixIcon,
          hintText: hintText,
          isSecure: isSecure,
          errorStyle: errorStyle,
          textStyle: textStyle,
          autovalidateMode: AutovalidateMode.disabled,
          inputAction: textInputAction ?? TextInputAction.next,
          fillColor: fillColor,
          validate: validate ??
              (value) {
                return isRequired == true
                    ? isNullEmpty(value)
                        ? StringConstants.requiredThisField
                        : null
                    : null;
              },
          focusNode: focusNode,
        ),
      ],
    ).paddingBottom(AppDimens.paddingMedium);
  }
}
