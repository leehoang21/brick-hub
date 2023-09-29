import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../../common/di/di.dart';
import '../../../../common/themes/themes.dart';
import '../../bloc/theme_bloc/theme_bloc.dart';
import '../widgets.dart';

class RuleValidatePassword extends StatelessWidget {
  const RuleValidatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = getIt.get<ThemeCubit>().isDark();
    TextStyle style = ThemeText.caption.copyWith(
      color: isDark ? AppColor.grey200 : AppColor.grey400,
      fontWeight: FontType.semiBold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyleLabel(title: "• Contains at least 8 character", style: style),
        StyleLabel(title: "• 01 upper case letter", style: style),
        StyleLabel(title: "• at least 01 number", style: style),
        StyleLabel(title: "• 01 special character (@,#,\$,%,..)", style: style)
      ],
    ).paddingBottom(AppDimens.paddingMedium);
  }
}
