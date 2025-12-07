import 'package:intl/intl.dart';

extension DateTimeToString on DateTime {
  DateTime get dateOnly {
    return DateTime(year, month, day);
  }

  String toMonthNameDate() {
    if (millisecondsSinceEpoch == 0) {
      return "N/A";
    }
    return DateFormat("MMMM dd, yyyy").format(this);
  }

  String toTime({bool withSecond = false, DateFormat? format}) {
    if (millisecondsSinceEpoch == 0) {
      return "N/A";
    }
    if (format != null) {
      return format.format(this);
    }
    if (withSecond) {
      return DateFormat('HH:mm:ss').format(this);
    }
    return DateFormat('HH:mm').format(this);
  }

  /// N/A or dd-MM-yyyy
  String toDate() {
    if (millisecondsSinceEpoch == 0) {
      return "N/A";
    }
    return DateFormat('dd-MM-yyyy').format(this);
  }

  String toWeekDayMonthDate() {
    if (millisecondsSinceEpoch == 0) {
      return "N/A";
    }
    return DateFormat('EEE. MMM, d').format(this);
  }
}

extension DateTimeIsValid on DateTime? {
  bool get isValid {
    return this != null && this!.millisecondsSinceEpoch != 0;
  }

  bool get isInvalid {
    return this == null || this!.millisecondsSinceEpoch == 0;
  }
}
