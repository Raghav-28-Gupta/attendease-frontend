import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateUtils {
  // Date Formatters
  static final DateFormat _dateFormatter = DateFormat('dd MMM yyyy');
  static final DateFormat _dateTimeFormatter = DateFormat('dd MMM yyyy, hh:mm a');
  static final DateFormat _timeFormatter = DateFormat('hh:mm a');
  static final DateFormat _dayMonthFormatter = DateFormat('dd MMM');
  static final DateFormat _fullDateFormatter = DateFormat('EEEE, dd MMMM yyyy');

  /// Format date to "01 Jan 2024"
  static String formatDate(DateTime date) {
    return _dateFormatter.format(date);
  }

  /// Format date and time to "01 Jan 2024, 10:30 AM"
  static String formatDateTime(DateTime dateTime) {
    return _dateTimeFormatter.format(dateTime);
  }

  /// Format time string "HH:mm" to "10:30 AM"
  static String formatTime(String time) {
    try {
      final parts = time.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      
      final now = DateTime.now();
      final dateTime = DateTime(now.year, now.month, now.day, hour, minute);
      
      return _timeFormatter.format(dateTime);
    } catch (e) {
      return time; // Return original if parsing fails
    }
  }

  /// Format time from TimeOfDay to "10:30 AM"
  static String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return _timeFormatter.format(dateTime);
  }

  /// Format to "01 Jan"
  static String formatDayMonth(DateTime date) {
    return _dayMonthFormatter.format(date);
  }

  /// Format to "Monday, 01 January 2024"
  static String formatFullDate(DateTime date) {
    return _fullDateFormatter.format(date);
  }

  /// Get relative time (Today, Yesterday, Tomorrow)
  static String getRelativeDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final compareDate = DateTime(date.year, date.month, date.day);

    final difference = compareDate.difference(today).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference == -1) {
      return 'Yesterday';
    } else if (difference > 1 && difference <= 7) {
      return DateFormat('EEEE').format(date); // Day name
    } else {
      return formatDate(date);
    }
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if date is in the past
  static bool isPast(DateTime date) {
    return date.isBefore(DateTime.now());
  }

  /// Check if date is in the future
  static bool isFuture(DateTime date) {
    return date.isAfter(DateTime.now());
  }

  /// Get day of week name
  static String getDayName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  /// Get short day name (Mon, Tue, etc.)
  static String getShortDayName(DateTime date) {
    return DateFormat('EEE').format(date);
  }

  /// Parse date string to DateTime
  static DateTime? parseDate(String dateString) {
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Get time difference in human readable format
  static String getTimeDifference(DateTime from, DateTime to) {
    final difference = to.difference(from);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''}';
    } else {
      return 'Just now';
    }
  }

  /// Convert TimeOfDay to HH:mm string
  static String timeOfDayToString(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  /// Parse HH:mm string to TimeOfDay
  static TimeOfDay? stringToTimeOfDay(String timeString) {
    try {
      final parts = timeString.split(':');
      return TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    } catch (e) {
      return null;
    }
  }
}
