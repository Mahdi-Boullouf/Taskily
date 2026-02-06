extension DateExtension on DateTime {
  bool get isToday => DateTime.now().day == day;
  bool get isInFuture => DateTime.now().day < day;
  bool get isInPast => DateTime.now().day > day;
}
