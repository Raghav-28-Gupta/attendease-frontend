import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  // Format date
  String format([String pattern = 'dd MMM yyyy']) {
    return DateFormat(pattern).format(this);
  }

  // Check if today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  // Check if tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  // Check if yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  // Get relative time string
  String get relativeTime {
    if (isToday) return 'Today';
    if (isTomorrow) return 'Tomorrow';
    if (isYesterday) return 'Yesterday';
    return format();
  }

  // Start of day
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  // End of day
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }
}
