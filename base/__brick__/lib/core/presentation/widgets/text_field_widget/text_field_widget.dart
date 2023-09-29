import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../../common/themes/themes.dart';
import 'text_field_constants.dart';

class TextFieldWidget extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initValue;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatter;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final bool? isSecure;
  final bool? readOnly;
  final bool? enabled;
  final Color? borderColor;
  final Color? fillColor;
  final BorderRadius? radius;
  final TextStyle? errorStyle;
  final int? maxLines;
  final TextInputAction? inputAction;
  final EdgeInsets? contentPadding;

  const TextFieldWidget({
    Key? key,
    this.enabled,
    this.labelText,
    this.hintText,
    this.initValue,
    this.height,
    this.radius,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.onChanged,
    this.validate,
    this.onSaved,
    this.onEditingComplete,
    this.onTap,
    this.autovalidateMode,
    this.inputFormatter,
    this.textAlign,
    this.textCapitalization,
    this.keyboardType,
    this.isSecure,
    this.inputAction,
    this.readOnly,
    this.fillColor,
    this.borderColor,
    this.errorStyle,
    this.width,
    this.contentPadding,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isShowSecure = false;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder commonBoder = OutlineInputBorder(
      borderSide:
          BorderSide(color: widget.borderColor ?? AppColor.grey400, width: 0.5),
      borderRadius: widget.radius ??
          BorderRadius.all(
            Radius.circular(AppDimens.borderTextField),
          ),
    );

    return TextFormField(
      readOnly: widget.readOnly ?? false,
      enabled: widget.enabled,
      maxLines: widget.isSecure == true ? 1 : widget.maxLines,
      controller: widget.controller,
      initialValue: widget.initValue,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      textAlign: widget.textAlign ?? TextAlign.start,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      obscureText:
          widget.isSecure == null ? false : isShowSecure != widget.isSecure,
      showCursor: true,
      focusNode: widget.focusNode,
      style: widget.textStyle ??
          Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16.sp),
      onSaved: widget.onSaved,
      validator: widget.validate,
      autovalidateMode:
          widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      textInputAction: widget.inputAction,
      scrollPadding: EdgeInsets.symmetric(vertical: 9.h),
      cursorColor: widget.textStyle?.color ??
          Theme.of(context).textTheme.bodyMedium?.color,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(
              horizontal: TextFieldConstants.contentPaddingHorizontal,
              vertical: TextFieldConstants.contentPaddingVertical,
            ),
        labelText: widget.labelText,
        labelStyle: widget.textStyle ??
            ThemeText.caption.copyWith(
                color: AppColor.grey800,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp),
        hintText: widget.hintText,
        hintStyle: ThemeText.body.copyWith(
          color: AppColor.grey400,
          fontWeight: FontType.regular,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, size: 25, color: AppColor.grey400)
            : null,
        suffixIcon: Focus(
          canRequestFocus: false,
          descendantsAreFocusable: false,
          child: widget.suffixIcon ??
              Visibility(
                  visible: widget.isSecure == true,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    icon: Icon(
                      !isShowSecure
                          ? Icons.remove_red_eye_sharp
                          : CupertinoIcons.eye_slash_fill,
                      color: AppColor.grey400,
                    ),
                    onPressed: () {
                      setState(() {
                        isShowSecure = !isShowSecure;
                      });
                    },
                  )),
        ),
        fillColor: widget.fillColor ?? Theme.of(context).cardColor,
        filled: true,
        errorStyle: widget.errorStyle ??
            ThemeText.label.copyWith(color: AppColor.errorColor),
        enabledBorder: commonBoder,
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: widget.borderColor ?? AppColor.primaryColor),
          borderRadius: widget.radius ??
              BorderRadius.all(
                Radius.circular(AppDimens.borderTextField),
              ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.errorColor),
          borderRadius: widget.radius ??
              BorderRadius.all(
                Radius.circular(AppDimens.borderTextField),
              ),
        ),
        focusedErrorBorder: commonBoder,
        disabledBorder: commonBoder,
        border: commonBoder,
      ),
    );
  }
}
