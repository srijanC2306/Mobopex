import 'package:intl/intl.dart';

import 'logger.dart';

class DateTimeUtil {
  static final DateTimeUtil _singleton = DateTimeUtil._internal();

  factory DateTimeUtil.getInstance() {
    return _singleton;
  }

  DateTimeUtil._internal();

  static final _yearMonthDateHoursMinSecFormatter =
      DateFormat('yyyy-MM-dd HH:mm:ss');
  static final _dayMonthShortNameYearFormatter = DateFormat('dd MMM yyyy');
  static final _weekDayMonthShortNameYearFormatter =
      DateFormat('EEE, dd MMM yyyy');
  static final _weekDayMonthFullNameYearFormatter =
      DateFormat('EEE, dd MMMM yyyy');
  static final _dayMonthFullNameYearFormatter = DateFormat('dd MMMM yyyy');
  static final _hoursMinutesSecondsFormatter = DateFormat('HH:mm:ss');
  static final _dayMonthYearFormatter = DateFormat('dd-MM-yyyy');
  static final _yearMonthDateFormatter = DateFormat('yyyy-MM-dd');
  static final _hoursMinutesFormatter = DateFormat('HH:mm');
  static final _weekMonthDayTimeYearFormatter =
      DateFormat('EEE MMM dd HH:mm:ss yyyy');

  static const _tag = "DateUtil";

  static String convertToDate(String input) {
    try {
      return _dayMonthShortNameYearFormatter
          .format(_yearMonthDateHoursMinSecFormatter.parse(input));
    } catch (e) {
      Logger.e(_tag, error: e);
      return "NA";
    }
  }

  static String convertToTime(String input) {
    try {
      return _hoursMinutesSecondsFormatter
          .format(_yearMonthDateHoursMinSecFormatter.parse(input));
    } catch (e) {
      Logger.e(_tag, error: e);
      return "NA";
    }
  }

  static bool isCurrentDateTimeRange(String dateTime1, String dateTime2) {
    try {
      DateTime? dT1 = convertToDateTime(dateTime1);
      DateTime? dT2 = convertToDateTime(dateTime2);
      if (dT1 != null && dT2 != null) {
        DateTime currentDateTime = DateTime.now();
        return (currentDateTime.isAfter(dT1) && currentDateTime.isBefore(dT2));
      }
      return false;
    } catch (e) {
      Logger.e(_tag, error: e);
      return false;
    }
  }

  static String convertDateTimeToDateAndTime(DateTime dateTime) {
    try {
      return _yearMonthDateHoursMinSecFormatter.format(dateTime);
    } catch (e) {
      Logger.e(_tag, error: e);
      return "";
    }
  }

  static DateTime? convertToDateTime(String date) {
    try {
      return DateTime.parse(date);
    } catch (e) {
      Logger.e(_tag, error: e);
      return null;
    }
  }

  static String convertToDateDayMonthYear(DateTime dateTime) {
    try {
      return _dayMonthYearFormatter.format(dateTime);
    } catch (e) {
      Logger.e(_tag, error: e);
      return "";
    }
  }

  static String convertToYearMonthDay(DateTime dateTime) {
    try {
      return _yearMonthDateFormatter.format(dateTime);
    } catch (e) {
      Logger.e(_tag, error: e);
      return "";
    }
  }

  static String convertToTimeHoursMinutes(DateTime dateTime) {
    try {
      return _hoursMinutesFormatter.format(dateTime);
    } catch (e) {
      Logger.e(_tag, error: e);
      return "";
    }
  }

  static String convertToDayMonthShortNameYearFormatter(DateTime dateTime) {
    try {
      return _dayMonthShortNameYearFormatter.format(dateTime);
    } catch (e) {
      Logger.e(_tag, error: e);
      return "";
    }
  }

  static String convertToDayMonthNameYearFormatter(DateTime dateTime) {
    try {
      return _dayMonthFullNameYearFormatter.format(dateTime);
    } catch (e) {
      Logger.e(_tag, error: e);
      return "";
    }
  }

  static String convertToWeekDayMonthNameYearFormatter(DateTime dateTime) {
    try {
      return _weekDayMonthShortNameYearFormatter.format(dateTime);
    } catch (e) {
      Logger.e(_tag, error: e);
      return "";
    }
  }

  static String convertToWeekDayMonthFullNameYearFormatter(DateTime dateTime) {
    try {
      return _weekDayMonthFullNameYearFormatter.format(dateTime);
    } catch (e) {
      Logger.e(_tag, error: e);
      return "";
    }
  }

  static String convertToWeekMonthDayTimeYearFormatter(DateTime dateTime) {
    try {
      String convertedDateTime =
          _weekMonthDayTimeYearFormatter.format(dateTime);
      int lastSpaceIndex = convertedDateTime.lastIndexOf(" ");
      convertedDateTime = convertedDateTime.replaceFirst(
          " ", " ${dateTime.timeZoneName} ", lastSpaceIndex);
      return convertedDateTime;
    } catch (e) {
      Logger.e(_tag, error: e);
      return "";
    }
  }

  static List<DateTime> getWeekDays() {
    var list = <DateTime>[];
    final dateTime = DateTime.now();
    var sunday = dateTime.subtract(Duration(days: dateTime.weekday));
    for (int i = 0; i < 7; i++) {
      list.add(sunday.add(Duration(days: i + 1)).copy);
    }
    return list;
  }
}

extension DateTimeExtension on DateTime {
  DateTime get copy {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  String format(String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }

  bool isSameDayDate(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }
}

/*
    ICU Name                   Skeleton
    --------                   --------
    DAY                          d
    ABBR_WEEKDAY                 E
    WEEKDAY                      EEEE
    ABBR_STANDALONE_MONTH        LLL
    STANDALONE_MONTH             LLLL
    NUM_MONTH                    M
    NUM_MONTH_DAY                Md
    NUM_MONTH_WEEKDAY_DAY        MEd
    ABBR_MONTH                   MMM
    ABBR_MONTH_DAY               MMMd
    ABBR_MONTH_WEEKDAY_DAY       MMMEd
    MONTH                        MMMM
    MONTH_DAY                    MMMMd
    MONTH_WEEKDAY_DAY            MMMMEEEEd
    ABBR_QUARTER                 QQQ
    QUARTER                      QQQQ
    YEAR                         y
    YEAR_NUM_MONTH               yM
    YEAR_NUM_MONTH_DAY           yMd
    YEAR_NUM_MONTH_WEEKDAY_DAY   yMEd
    YEAR_ABBR_MONTH              yMMM
    YEAR_ABBR_MONTH_DAY          yMMMd
    YEAR_ABBR_MONTH_WEEKDAY_DAY  yMMMEd
    YEAR_MONTH                   yMMMM
    YEAR_MONTH_DAY               yMMMMd
    YEAR_MONTH_WEEKDAY_DAY       yMMMMEEEEd
    YEAR_ABBR_QUARTER            yQQQ
    YEAR_QUARTER                 yQQQQ
    HOUR24                       H
    HOUR24_MINUTE                Hm
    HOUR24_MINUTE_SECOND         Hms
    HOUR                         j
    HOUR_MINUTE                  jm
    HOUR_MINUTE_SECOND           jms
    HOUR_MINUTE_GENERIC_TZ       jmv
    HOUR_MINUTE_TZ               jmz
    HOUR_GENERIC_TZ              jv
    HOUR_TZ                      jz
    MINUTE                       m
    MINUTE_SECOND                ms
    SECOND                       s
*/
