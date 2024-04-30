import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String yearMonthDayFormatJp({bool isAvoidSpace = false}) {
    if (isAvoidSpace) {
      return DateFormat('y年MM月dd日', 'ja_JP').format(this);
    }
    return DateFormat('y年 MM月 dd日', 'ja_JP').format(this);
  }

  String formatDateTimeString() {
    return DateFormat("yyyy-MM-dd").format(this);
  }

  String formatYearMonthString() {
    return DateFormat("yyyy-MM").format(this);
  }

  String formatYearMonthDayString() {
    return DateFormat("yyyy/MM/dd").format(this);
  }

  String formatDayTimeString() {
    return DateFormat("M/d(E) HH:mm", 'ja_JP').format(this);
  }

  String formatMonthDayString() {
    return DateFormat("MM月dd日", 'ja_JP').format(this);
  }

  String formatYearMonthDayStringJa() {
    return DateFormat("yyyy年MM月dd日", 'ja_JP').format(this);
  }

  String formatYearMonthDayWeekString() {
    return DateFormat('yyyy/MM/dd(E)', 'ja_JP').format(this);
  }

  String formatYearMonthDayTimeString() {
    return DateFormat('yyyy/MM/dd(E) HH:mm', 'ja_JP').format(this);
  }

  String formatTimeString() {
    return DateFormat('HH:mm', 'ja_JP').format(this);
  }

  String commaDelimited() {
    return '$year.$month.$day';
  }

  String elapsedTime() {
    return (DateTime.now().difference(this).inDays >= 1)
        ? '${DateTime.now().difference(this).inDays}日前'
        : '${DateTime.now().difference(this).inHours}時間前';
  }
}

extension StringDateTimeExt on String {
  DateTime convertToDateTime() {
    final dateFormatter = DateFormat('yyyy-MM-dd');
    return dateFormatter.parseStrict(this);
  }

  DateTime convertToYearMonthDateTime() {
    final dateFormatter = DateFormat('yyyy-MM');
    return dateFormatter.parseStrict(this);
  }

  String formatJstDateStr(String pattern) {
    DateTime datetime = DateTime.parse(this).toLocal();
    return DateFormat(pattern).format(datetime);
  }

  String elapsedTime() {
    var _this = DateTime.parse(this).toLocal();
    String formattedDate = DateFormat("MM/dd HH:mm").format(_this);
    if (DateTime.now().difference(_this).inDays >= 1) {
      return '${DateTime.now().difference(_this).inDays}日前 ($formattedDate)';
    } else {
      return '${DateTime.now().difference(_this).inHours}時間前 ($formattedDate)';
    }
  }

  String remainingTime() {
    var _this = DateTime.parse(this);
    var remainingDuration = _this.difference(DateTime.now());

    if (remainingDuration.isNegative) {
      return '';
    }

    if (remainingDuration.inDays >= 1) {
      return '期限まであと${remainingDuration.inDays}日';
    }

    if (remainingDuration.inHours >= 1) {
      return '期限まであと${remainingDuration.inHours}時間';
    }

    return '期限まであと${remainingDuration.inMinutes}分';
  }

  String formatUtcDateStr(String pattern) {
    DateTime datetime = DateTime.parse(this);
    return DateFormat(pattern).format(datetime);
  }

  DateTime formatJstDate() {
    return DateTime.parse(this).toLocal();
  }

  // 運用期間
  String operationPeriod(String endTime) {
    DateTime operationBeginAt = DateTime.parse(this);
    DateTime operationEndAt = DateTime.parse(endTime);

    // 最後の1分前を加算して計算
    operationEndAt = operationEndAt.add(const Duration(minutes: 1));

    int totalMonths = (operationEndAt.year - operationBeginAt.year) * 12 +
        operationEndAt.month -
        operationBeginAt.month;

    int years = totalMonths ~/ 12;
    int months = totalMonths % 12;

    String durationString = '';
    if (years > 0) {
      durationString += '$years年';
    }
    if (months > 0) {
      durationString += '$monthsヶ月';
    }

    return durationString;
  }

  // 募集期間
  String collectPeriod(String endTime) {
    DateTime collectBeginAt = DateTime.parse(this);
    DateTime collectEndAt = DateTime.parse(endTime);
    String startYear = collectBeginAt.year.toString();
    String startMonth = collectBeginAt.month.toString();
    String startDay = collectBeginAt.day.toString();

    String endYear = collectEndAt.year.toString();
    String endMonth = collectEndAt.month.toString();
    String endDay = collectEndAt.day.toString();

    if (startYear == endYear) {
      return '$startMonth/$startDay～$endMonth/$endDay';
    } else {
      return '$startMonth/$startDay～$endMonth/$endDay';
    }
  }

  // Fund募集期間
  String formatDateRange(String end, DateTime now) {
    DateTime collectBeginAt = DateTime.parse(this);
    DateTime collectEndAt = DateTime.parse(end);
    bool isInFuture = collectBeginAt.isAfter(now);
    String startYear = collectBeginAt.year.toString();
    String startMonth = collectBeginAt.month.toString().padLeft(2, '0');
    String startDay = collectBeginAt.day.toString().padLeft(2, '0');

    String endYear = collectEndAt.year.toString();
    String endMonth = collectEndAt.month.toString().padLeft(2, '0');
    String endDay = collectEndAt.day.toString().padLeft(2, '0');

    String formattedString = '';
    if (isInFuture) {
      formattedString = '$startYear年$startMonth月$startDay日～';
    } else {
      formattedString =
          '$startYear年$startMonth月$startDay日～$endYear年$endMonth月$endDay日';
    }

    return formattedString;
  }
}
