class AppValidator {
  static const String _validateEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static bool isEmail(String email) => RegExp(_validateEmail).hasMatch(email);

  bool isNullEmpty(Object o) => "" == o;

  static const String _validatePhone = r'0\d{8,}';
  static bool isPhone(String phone) => RegExp(_validatePhone).hasMatch(phone);
}
