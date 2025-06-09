extension DateTimeExtensions on DateTime {
  // Date formatting methods
  String toShortDate() =>
      '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  String toFullDate() =>
      '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String toCustomFormat({String separator = '/'}) =>
      '${day.toString().padLeft(2, '0')}$separator${month.toString().padLeft(2, '0')}$separator$year';
  String toTimeOnly() =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  // Comparison methods
  bool isSameDate(DateTime other) =>
      day == other.day && month == other.month && year == other.year;
  bool isToday() => isSameDate(DateTime.now());
  bool isTomorrow() => isSameDate(DateTime.now().add(const Duration(days: 1)));
  bool isYesterday() =>
      isSameDate(DateTime.now().subtract(const Duration(days: 1)));
  bool isFuture() => isAfter(DateTime.now());
  bool isPast() => isBefore(DateTime.now());
  bool isWeekend() =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  // Date manipulation methods
  DateTime startOfDay() => DateTime(year, month, day);
  DateTime endOfDay() => DateTime(year, month, day, 23, 59, 59, 999);
  DateTime startOfWeek() => subtract(Duration(days: weekday - 1));
  DateTime startOfMonth() => DateTime(year, month, 1);
  DateTime endOfMonth() => DateTime(year, month + 1, 0);

  // Time difference methods
  int getDifferenceInDays(DateTime other) => difference(other).inDays;
  bool isWithinLast({int? days, int? hours, int? minutes}) {
    final now = DateTime.now();
    final difference = now.difference(this);
    if (days != null) return difference.inDays <= days;
    if (hours != null) return difference.inHours <= hours;
    if (minutes != null) return difference.inMinutes <= minutes;
    return false;
  }

  // Age calculation
  int getAge() {
    final today = DateTime.now();
    int age = today.year - year;
    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }
    return age;
  }
}
