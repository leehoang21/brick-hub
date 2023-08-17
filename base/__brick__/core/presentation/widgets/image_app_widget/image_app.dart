// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_eglife_ecommerce_admin/common/utils/app_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../themes/themes.dart';

// ignore: must_be_immutable
class ImageAppWidget extends StatelessWidget {
  final String? path;
  bool isRemote = false;
  Widget? placeholder;
  Widget? errorWidget;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Color? color;

  ImageAppWidget({
    Key? key,
    required this.path,
    this.placeholder,
    this.errorWidget,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  Widget get _placeholder {
    return Center(
        child: SizedBox(
      width: width ?? 6,
      height: height ?? 6,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
        strokeWidth: 2,
      ),
    ));
  }

  Widget get _errorWidget {
    return const Center(child: Icon(Icons.error));
  }

  Widget get _nullPathWidget {
    return const SizedBox();
  }

  Widget _buildLottieImageWidget() {
    if (isRemote) {
      return image(NetworkImage(path!));
    }

    return image(FileImage(File(path!)));
  }

  Widget _buildSvgImageWidget() {
    if (isRemote) {
      return SvgPicture.network(
        path!,
        fit: fit,
        width: width,
        height: height,
        color: color,
        placeholderBuilder: (context) => placeholder ?? _placeholder,
      );
    }

    return SvgPicture.asset(
      path!,
      fit: fit,
      width: width,
      height: height,
      color: color,
      placeholderBuilder: (context) => placeholder ?? _placeholder,
    );
  }

  Widget _buildNormalImageWidget() {
    if (isRemote) {
      return image(NetworkImage(path!));
    }
    return image(AssetImage(path!));
  }

  ImageProvider get getImage {
    if (checkRemote()) {
      return NetworkImage(path!);
    }
    return AssetImage(path!);
  }

  Image image(ImageProvider<Object> image) => Image(
        image: image,
        fit: fit,
        width: width,
        height: height,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return placeholder ?? _placeholder;
        },
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ?? _errorWidget,
      );

  @override
  Widget build(BuildContext context) {
    isRemote = checkRemote();
    if (isNullEmpty(path)) {
      return _nullPathWidget;
    }
    switch (imageType) {
      case ImageType.file:
        return _buildLottieImageWidget();
      case ImageType.svg:
        return _buildSvgImageWidget();
      default:
        return _buildNormalImageWidget();
    }
  }

  ImageType get imageType {
    int length = path!.length;
    String firstString = path!.substring(0, 5).toUpperCase();
    String lastString = path!.substring(length - 5).toUpperCase();
    if (lastString.contains('.svg'.toUpperCase())) {
      return ImageType.svg;
    } else if (firstString.contains('asset'.toUpperCase())) {
      return ImageType.image;
    } else {
      return ImageType.file;
    }
  }

  bool checkRemote() {
    if (path!.contains('http://') || path!.contains('https://')) {
      return true;
    }
    return false;
  }
}

enum ImageType { svg, image, file }
