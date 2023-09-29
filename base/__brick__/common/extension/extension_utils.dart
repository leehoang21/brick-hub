import 'package:idolise/common/constants/string_constants.dart';
import 'package:idolise/common/extension/translate_extension.dart';
import 'package:idolise/common/utils/utils_src.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String formatCurrencyPurchase() {
    return "VNĐ ${replaceAll("₫", "").replaceAll(".", ",").trim()}";
  }

  String addLeadingZero() {
    int number = int.parse(this);
    return number.toString().padLeft(2, '0');
  }

  String getFileExtension(String filePath) {
    String extension = '';
    int dotIndex = filePath.lastIndexOf('.');
    if (dotIndex != -1 && dotIndex < filePath.length - 1) {
      extension = filePath.substring(dotIndex + 1);
    }
    return extension;
  }

  String convertStringMonth() {
    switch (this) {
      case 'January':
        return '01';
      case 'February':
        return '02';
      case 'March':
        return '03';
      case 'April':
        return '04';
      case 'May':
        return '05';
      case 'June':
        return '06';
      case 'July':
        return '07';
      case 'August':
        return '08';
      case 'September':
        return '09';
      case 'October':
        return '10';
      case 'November':
        return '11';
      case 'December':
        return '12';
      default:
        return '';
    }
  }
}

extension Validator on String? {
  String? validateEmailApp() {
    if (isNullEmpty(this)) {
      return StringConstants.requiredThisField;
    } else if (this!.length < 8 || !_validateStructureEmail(this!.trim())) {
      return StringConstants.emailInvalid;
    } else {
      return null;
    }
  }

  String? validatePassword() {
    if (isNullEmpty(this)) {
      return StringConstants.requiredThisField;
    } else if (this!.length < 8 || !_validateStructurePassword(this!)) {
      return StringConstants.passwordInvalid;
    } else {
      return null;
    }
  }

  String? validateUserName() {
    if (isNullEmpty(this)) {
      return StringConstants.requiredThisField;
    } else if (!_isStringWithoutDiacritics(this!) || this!.contains(' ')) {
      return StringConstants.userNameInvalid;
    } else {
      return null;
    }
  }

  bool _validateStructurePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~_%]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool _validateStructureEmail(String value) {
    String pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool _isStringWithoutDiacritics(String input) {
    final normalizedString = input
        .toLowerCase()
        .replaceAll(RegExp(r'[àáạảãâầấậẩẫăằắặẳẵ]'), 'a')
        .replaceAll(RegExp(r'[èéẹẻẽêềếệểễ]'), 'e')
        .replaceAll(RegExp(r'[ìíịỉĩ]'), 'i')
        .replaceAll(RegExp(r'[òóọỏõôồốộổỗơờớợởỡ]'), 'o')
        .replaceAll(RegExp(r'[ùúụủũưừứựửữ]'), 'u')
        .replaceAll(RegExp(r'[ỳýỵỷỹ]'), 'y')
        .replaceAll(RegExp(r'[đ]'), 'd');
    return normalizedString == input;
  }

  String formatTimeDifference() {
    DateTime now = DateTime.now();
    DateTime parsedDate = DateTime.parse(this!);

    Duration difference = now.difference(parsedDate);

    if (difference.inSeconds < 60) {
      return "a few seconds ago".tr;
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} ${'minutes ago'.tr}";
    } else if (difference.inHours < 24) {
      return "${difference.inHours}  ${'hours ago'.tr}";
    } else {
      return "${difference.inDays} ${'days ago'.tr}";
    }
  }
}

extension DurationTimer on Duration {
  String fomartTimerRecording() {
    int minutes = inMinutes;
    int seconds = inSeconds.remainder(60);

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }
}

extension NumberExtension on int {
  String formatDisplay() {
    return this < 10 && this != 0 ? "0$this" : "$this";
  }

  String formatCurrency() {
    return "VNĐ ${toCurrencyFormat().replaceAll(".", ",")}";
  }
}

extension IntCurrencyFormatting on int {
  String toCurrencyFormat() {
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }
}
