import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idolise/common/local_storage/local_storage.dart';
import 'package:idolise/common/utils/app_utils.dart';
import 'package:idolise/core/presentation/routers/app_router.dart';
import 'package:idolise/core/presentation/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/assets/assets.gen.dart';

@RoutePage()
class SplashPageProvider extends StatefulWidget {
  const SplashPageProvider({super.key});

  @override
  State<SplashPageProvider> createState() => _SplashPageProviderState();
}

class _SplashPageProviderState extends State<SplashPageProvider> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3)).then((value) =>
          isNullEmpty(LocalStorage.accessToken.val)
              ? context.router.pushAndPopUntil(const BoardingPageRoute(),
                  predicate: (route) => false)
              : context.router.pushAndPopUntil(const HomePageRoute(),
                  predicate: (route) => false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      backgroundImage: ImageAppWidget(
        path: Assets.images.boarding1.keyName,
        fit: BoxFit.cover,
      ),
      body: Center(
        child: Assets.icons.appLogoWhite.svg().paddingBottom(90.h),
      ),
    );
  }
}
