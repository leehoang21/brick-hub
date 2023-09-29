import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/assets/assets.gen.dart';
import 'image_app.dart';

class ImageAvatarCustomSmall extends StatelessWidget {
  final String path;
  const ImageAvatarCustomSmall({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(43.r),
      child: ImageAppWidget(
        path: path,
        width: 48.w,
        height: 44.w,
        fit: BoxFit.cover,
        defultImage: Assets.images.boarding1.image(),
      ),
    );
  }
}
