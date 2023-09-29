// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../../common/themes/themes.dart';
import '../widgets.dart';

class LikeButtonIdolise extends StatelessWidget {
  final int likeCount;
  final bool isLiked;
  final Future<bool?> Function(bool)? onTap;
  const LikeButtonIdolise({
    Key? key,
    required this.likeCount,
    required this.isLiked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 25,
      // isLiked: isLiked,
      padding: EdgeInsets.zero,
      circleColor: const CircleColor(start: AppColor.secondary201, end: AppColor.primaryColor),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: AppColor.secondary501,
        dotSecondaryColor: AppColor.secondary301,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          color: isLiked ? AppColor.primaryColor : Theme.of(context).highlightColor,
          size: 25,
        );
      },
      // onTap: onTap,
      likeCount: likeCount,
      countBuilder: (likeCount, isLiked, text) => StyleLabel(
        title: text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontFamily: FontFamily.nordiquePro,
              fontWeight: FontType.semiBold,
              letterSpacing: 1.5,
            ),
      ),
      bubblesSize: 20, // countBuilder: ,
    );
  }
}
