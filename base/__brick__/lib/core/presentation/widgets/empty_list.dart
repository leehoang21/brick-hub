import 'package:flutter/material.dart';
import 'package:idolise/common/constants/string_constants.dart';
import 'package:idolise/core/presentation/widgets/text_widget/style_lable.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StyleLabel(
        title: StringConstants.emptyList,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
