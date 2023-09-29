import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/constants/app_dimens.dart';
import '../widgets.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final VoidCallback onChanged;
  final Color? colorCheckBox;
  final TextStyle? textStyle;
  final String? title;
  final RichText? richText;
  const CustomCheckbox(
      {Key? key,
      required this.value,
      required this.onChanged,
      this.colorCheckBox,
      this.textStyle,
      this.title,
      this.richText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(),
      child: Row(
        children: [
          AnimatedContainer(
              height: 20,
              width: 20,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: colorCheckBox ?? Theme.of(context).iconTheme.color!.withOpacity(0.6),
                    width: 1.5,
                  )),
              child: value
                  ? Center(
                      child: Icon(
                      Icons.check_rounded,
                      color: colorCheckBox ?? Theme.of(context).iconTheme.color!.withOpacity(0.6),
                      weight: 2,
                      size: 18,
                    ))
                  : null),
          AppDimens.sizedBoxWidth10,
          richText == null
              ? StyleLabel(
                  title: title ?? "",
                  style: textStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.2),
                  maxLines: 2,
                ).expand()
              : richText.expand(),
        ],
      ),
    );
  }
}
