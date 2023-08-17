import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/debouncer.dart';
import '../../../../themes/themes.dart';
import 'text_field_constants.dart';

class TextFieldWidget extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initValue;
  final Color? color;
  final Color? disabledColor;
  final double? width;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSearch;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatter;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? readOnly;
  final bool? enabled;
  final GlobalKey<FormState>? formKey;
  final int maxLines;
  final bool isSecurity;

  const TextFieldWidget({
    Key? key,
    this.enabled,
    this.labelText,
    this.hintText,
    this.initValue,
    this.color,
    this.width,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.focusNode,
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
    this.obscureText,
    this.readOnly,
    this.formKey,
    this.disabledColor,
    this.maxLines = 1,
    this.onSearch,
    this.isSecurity = false,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          maxLines: widget.maxLines,
          readOnly: widget.readOnly ?? false,
          enabled: widget.enabled,
          controller: widget.controller,
          initialValue: widget.initValue,
          onChanged: (value) {
            widget.onChanged?.call(value);
            Debouncer().run(() {
              widget.onSearch?.call(value);
            });
          },
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          textAlign: widget.textAlign ?? TextAlign.start,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          obscureText: widget.obscureText ?? _obscureText,
          style: widget.textStyle ??
              ThemeText.caption2
                  .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
          onSaved: widget.onSaved,
          validator: widget.validate,
          autovalidateMode: widget.autovalidateMode,
          inputFormatters: widget.inputFormatter,
          keyboardType: widget.keyboardType,
          scrollPadding: EdgeInsets.symmetric(vertical: 9.h),
          cursorColor: AppColor.hintColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: TextFieldConstants.contentPaddingHorizontal,
              vertical: TextFieldConstants.contentPaddingVertical,
            ),
            labelText: widget.labelText,
            labelStyle: widget.textStyle ??
                ThemeText.caption2.copyWith(
                    color: AppColor.tuna, fontWeight: FontWeight.w400),
            hintText: widget.hintText,
            hintStyle: widget.textStyle ??
                ThemeText.caption2.copyWith(
                    color: AppColor.tuna, fontWeight: FontWeight.w400),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isSecurity
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      !_obscureText ? Icons.visibility : Icons.visibility_off,
                      color: AppColor.tuna,
                    ),
                  )
                : widget.suffixIcon,
            fillColor: widget.enabled != false
                ? (widget.color ?? AppColor.fieldColor)
                : (widget.disabledColor ?? AppColor.disabledColor),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldDropDownWidget<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final T? initValue;
  final Color? color;
  final double? width;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Function(T?)? onChanged;
  final Function(T?)? onSearch;
  final Function()? onTap;
  final String? Function(T?)? validate;
  final Function(T?)? onSaved;
  final List<DropdownMenuItem<T>>? items;
  final GlobalKey<FormState>? formKey;
  final AutovalidateMode? autovalidateMode;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;

  const TextFieldDropDownWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.initValue,
    this.color,
    this.width,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onChanged,
    this.validate,
    this.onSaved,
    this.autovalidateMode,
    this.onTap,
    this.formKey,
    this.items,
    this.selectedItemBuilder,
    this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Form(
        key: formKey,
        child: DropdownButtonFormField<T>(
          value: initValue,
          selectedItemBuilder: selectedItemBuilder,
          onChanged: (value) {
            onChanged?.call(value);
            onSearch?.call(value);
          },
          onTap: onTap,
          style: ThemeText.caption2
              .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
          onSaved: onSaved,
          validator: validate,
          autovalidateMode: autovalidateMode,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: TextFieldConstants.contentPaddingHorizontal,
              vertical: TextFieldConstants.contentPaddingVertical,
            ),
            labelText: labelText,
            labelStyle: textStyle ??
                ThemeText.caption2.copyWith(
                    color: AppColor.tuna, fontWeight: FontWeight.w400),
            hintText: hintText,
            hintStyle: textStyle ??
                ThemeText.caption2.copyWith(
                    color: AppColor.tuna, fontWeight: FontWeight.w400),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            fillColor: color ?? AppColor.fieldColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
          ),
          items: items,
        ),
      ),
    );
  }
}
