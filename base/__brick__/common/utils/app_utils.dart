import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slugify/slugify.dart';

void logger(Object? message) {
  log('app_logger: {$message}');
}

bool isNullEmpty(Object? o) => o == null || "" == o || o == "null";

bool isNullEmptyOrFalse(Object? o) => o == null || false == o || "" == o;

bool isNullEmptyFalseOrZero(Object? o) =>
    o == null || false == o || 0 == o || "" == o || "0" == o;

bool isNullEmptyList<T>(List<T>? t) => t == null || [] == t || t.isEmpty;

bool isNullEmptyMap<T>(Map<T, T>? t) => t == null || {} == t || t.isEmpty;

bool isNumeric(dynamic s) {
  String sConvert = s.toString();
  if (isNullEmpty(sConvert)) {
    return false;
  }
  return (double.tryParse(sConvert) != null || int.tryParse(sConvert) != null);
}

bool isInterger(dynamic s) {
  String sConvert = s.toString();
  if (isNullEmpty(sConvert)) {
    return false;
  }
  return (int.tryParse(sConvert) != null);
}

String parseColorToString(Color color) {
  return '0x${color.value.toRadixString(16).substring(0, 8)}';
}

Color parseStringToColor(String? color) {
  final colorInt = int.tryParse(color ?? '');
  if (colorInt == null) {
    return Colors.white;
  }
  final result = Color(colorInt);
  return result;
}
