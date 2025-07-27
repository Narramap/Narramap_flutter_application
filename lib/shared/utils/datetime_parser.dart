
DateTime parseHour(String hour) {
  final parts = hour.split(":");
  final now = DateTime.now();
  final hourInt = int.parse(parts[0]);
  final minuteInt = int.parse(parts[1]);
  return DateTime(now.year, now.month, now.day, hourInt, minuteInt);
}

String toHourMinuteTimeString(DateTime value) => "${value.hour.toString().padLeft(2, "0")}:${value.minute.toString().padLeft(2, "0")}";