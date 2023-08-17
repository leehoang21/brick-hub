import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eglife_ecommerce_admin/core/presentation/routers/app_router.dart';
import 'package:flutter_eglife_ecommerce_admin/themes/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'not_auth_contants.dart';

class NotAuthWidget extends StatelessWidget {
  const NotAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          NotAuthContants.title,
          style: ThemeText.caption2,
        ),
        SizedBox(
          height: 12.h,
        ),
        TextButton(
          onPressed: () {
            context.pushRoute(LoginScreenRoute());
          },
          child: Text(
            'OK',
            style: ThemeText.caption3,
          ),
        ),
      ],
    );
  }
}
