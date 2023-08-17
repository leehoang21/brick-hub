import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eglife_ecommerce/common/constants/app_dimens.dart';
import 'package:flutter_eglife_ecommerce/common/extension/translate_extension.dart';
import 'package:flutter_eglife_ecommerce/core/presentation/routers/app_router.dart';
import 'package:flutter_eglife_ecommerce/core/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_eglife_ecommerce/themes/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/images/app_images.dart';
import '../image_app_widget/image_app.dart';
import 'flash.dart';

class DialogNoAuth extends StatelessWidget {
  const DialogNoAuth({
    super.key,
    required this.controller,
  });
  final FlashController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimens.width_20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.width_20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: Colors.white,
        image: DecorationImage(
          image: ImageAppWidget(
            path: AppImages.background_login,
          ).getImage!,
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: AppDimens.height_20,
          ),
          ImageAppWidget(
            path: AppImages.splash_logo,
            width: 120.w,
          ).paddingBottom(AppDimens.height_20),
          Text(
            'no_auth'.tr,
            style: ThemeText.headline7.copyWith(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: AppDimens.height_20,
          ),
          Row(
            children: [
              Expanded(
                child: TextButtonWidget(
                  onPressed: () {
                    controller.dismiss();
                  },
                  title: 'cancel'.tr,
                  buttonColor: AppColor.grey,
                  borderColor: AppColor.grey,
                ),
              ),
              SizedBox(
                width: AppDimens.width_12,
              ),
              Expanded(
                child: TextButtonWidget(
                  onPressed: () {
                    controller.dismiss();
                    context.router.pushAndPopUntil(LoginPageRoute(),
                        predicate: (_) => false);
                  },
                  title: 'login'.tr,
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.height_20,
          ),
        ],
      ),
    );
  }
}
