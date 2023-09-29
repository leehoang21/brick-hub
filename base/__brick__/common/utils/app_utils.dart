import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../themes/themes.dart';

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

Future<File?> getFile(FileType fileType) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
  );
  if (result != null) {
    File file = File(result.files.single.path!);
    return file;
  }
  return null;
}

String formatDate(String input) {
  DateTime dateTime = DateTime.parse(input);
  String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  return formattedDate;
}

String addDaysToDateString(String inputDate, int daysToAdd) {
  DateTime dateTime = DateTime.parse(inputDate).add(Duration(days: daysToAdd));
  return dateTime.toString();
}

int expiredDays(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  final difference = dateTime.difference(DateTime.now()).inDays;
  return difference;
}

class AppUtils {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: AppColor.grey400.withOpacity(0.5),
      textColor: AppColor.textColor,
    );
  }
}

bool isEmptyAll(Object? o) =>
    o == null ||
    false == o ||
    "" == o ||
    "null" == o ||
    ((o is num) ? o > 0 : false);

void logger(Object? ob) {
  log(ob.toString());
}

bool checkRemote(String path) {
  if (path.contains('http://') || path.contains('https://')) {
    return true;
  }
  return false;
}
