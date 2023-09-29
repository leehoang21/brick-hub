import '../constants/string_constants.dart';
import 'base_error.dart';

class ExpiredTimeError extends BaseError {
  ExpiredTimeError({message, errors}) : super(message: message, errors: errors);

  @override
  String toString() {
    return message ?? StringConstants.msgErrorUnknown;
  }
}
