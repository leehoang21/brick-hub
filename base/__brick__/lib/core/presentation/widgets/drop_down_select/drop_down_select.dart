import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idolise/common/utils/utils_src.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../../common/constants/string_constants.dart';
import '../../../../common/themes/themes.dart';
import '../text_field_widget/text_field_constants.dart';
import '../widgets.dart';

class DropDownSelectCustome<T> extends StatelessWidget {
  final Function(T?)? onChanged;
  final String lable;
  final String hintText;
  final List<T> items;
  final T? value;
  final Color? borderColor;
  final double? borderRadius;
  final String? Function(T?)? validate;
  final bool? isRequired;
  final List<DropdownMenuItem<T>>? childBuilder;
  final VoidCallback? onTapEmpty;
  const DropDownSelectCustome({
    Key? key,
    this.onChanged,
    required this.lable,
    required this.hintText,
    required this.items,
    this.value,
    this.validate,
    this.isRequired,
    this.borderColor,
    this.borderRadius,
    this.childBuilder,
    this.onTapEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder commonBoder = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? AppColor.grey400, width: 0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius ?? AppDimens.borderTextField),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyleLabel(
          title: lable,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontType.bold,
              ),
        ).paddingBottom(AppDimens.paddingSmall),
        DropdownButtonFormField<T>(
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColor.grey400),
          elevation: 2,
          validator: validate ??
              (value) {
                return isRequired == true
                    ? isNullEmpty(value)
                        ? StringConstants.requiredThisField
                        : null
                    : null;
              },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: TextFieldConstants.contentPaddingHorizontal,
              vertical: TextFieldConstants.contentPaddingVertical,
            ),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            enabledBorder: commonBoder,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? AppColor.primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? AppDimens.borderTextField),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.errorColor),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? AppDimens.borderTextField),
              ),
            ),
            focusedErrorBorder: commonBoder,
            disabledBorder: commonBoder,
            border: commonBoder,
          ),
          dropdownColor: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppDimens.borderTextField),
          onChanged: onChanged,
          menuMaxHeight: MediaQuery.sizeOf(context).width / 2,
          isExpanded: true,
          hint: StyleLabel(
            title: hintText,
            style: ThemeText.body.copyWith(color: AppColor.grey400, fontWeight: FontType.regular),
          ),
          items: childBuilder ?? items.map((e) => _buildDropDownMenu(context, e)).toList(),
        ).onTap(onTapEmpty),
      ],
    ).paddingBottom(AppDimens.paddingMedium);
  }

  DropdownMenuItem<T> _buildDropDownMenu(BuildContext context, T value) {
    return DropdownMenuItem<T>(
        value: value,
        child: StyleLabel(
          title: value.toString(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16.sp),
        ).paddingRight(AppDimens.paddingMedium));
  }
}

class DateTimePickerDrop extends StatelessWidget {
  final String lable;
  final Function(String?)? onChangedDay;
  final Function(String?)? onChangedMonth;
  final Function(String?)? onChangedYear;
  const DateTimePickerDrop(
      {super.key, required this.lable, this.onChangedDay, this.onChangedMonth, this.onChangedYear});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyleLabel(
          title: lable,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontType.bold,
              ),
        ).paddingBottom(AppDimens.paddingSmall),
        DropdownDatePicker(
          boxDecoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(AppDimens.borderTextField)),
          inputDecoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              fillColor: Theme.of(context).cardColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.borderTextField),
                borderSide: const BorderSide(color: AppColor.grey400, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.borderTextField),
                borderSide: const BorderSide(color: AppColor.primaryColor, width: 0.5),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppDimens.borderTextField))), // optional
          isDropdownHideUnderline: true, // optional
          isFormValidator: true, // optional
          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16.sp, color: AppColor.grey400),
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColor.grey400),
          hintTextStyle: ThemeText.body.copyWith(
            color: AppColor.grey400,
            fontWeight: FontType.regular,
          ), // optional
          onChangedDay: onChangedDay,
          onChangedMonth: onChangedMonth,
          onChangedYear: onChangedYear,
          errorDay: "Select day",
          errorMonth: "Select month",
          errorYear: "Select year",
          monthFlex: 5,
          dayFlex: 4,
          yearFlex: 4, // optional // optional
        ),
      ],
    ).paddingBottom(AppDimens.paddingMedium);
  }
}
