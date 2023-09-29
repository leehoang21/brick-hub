

extension FormatDateTimeExtension on DateTime {
  String getDayAgo() {
  final now = DateTime.now();
  final diff = now.difference(this);
  if (diff.inDays > 0) {
    return '${diff.inDays} day ago';
  } else if (diff.inHours > 0) {
    return '${diff.inHours} hour ago';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes} minute ago';
  } else if (diff.inSeconds > 0) {
    return '${diff.inSeconds} second ago';
  } else {
    return 'just now';
  }
}
}