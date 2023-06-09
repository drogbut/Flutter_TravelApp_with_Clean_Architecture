import 'package:intl/intl.dart';

String formattedPrice(double price, {final String symbol = '€'}) =>
    NumberFormat.currency(
      symbol: symbol,
      decimalDigits: 2,
      //TODO try to pass from AppLocalizations, doesn't work show properly
      // for 'en' though
      locale: 'de_DE',
    ).format(price);

/*String formatBp(
  final AppLocalizations appLocalizations,
  final int amount,
  final String unitCode,
) =>
    '${appLocalizations.labelReceive} $amount $unitCode';*/

String formatBpUnitCode(
  final int amount,
  final String unitCode,
) =>
    '$amount $unitCode';

final _dateTimeFormatter = DateFormat('dd.MM.yyyy HH:mm');
final _dateFormatter = DateFormat('dd.MM.yyyy');
final _timeFormatter = DateFormat('HH:mm');

String formatDateTime(final DateTime dateTime) =>
    _dateTimeFormatter.format(dateTime.toLocal());

String formatDate(final DateTime dateTime) =>
    _dateFormatter.format(dateTime.toLocal());

String formatTime(final DateTime dateTime) =>
    _timeFormatter.format(dateTime.toLocal());

// TODO find a solution to format address depending on country
/*String formatAddress(MandantStore s) {
  return '${s.address.street} '
      ' ${s.address.streetNumber}, '
      ' ${s.address.zip} '
      ' ${s.address.city}, '
      '${s.address.country.name}';
}*/

String capitalizeChar(String inputString, int nrChar) {
  return inputString.replaceFirst(
      inputString[nrChar], inputString[nrChar].toUpperCase());
}

//parse a string of 'hh:mm:ss' format
DateTime parseTimeString(final String time,
    {required final DateTime datetime}) {
  final DateFormat dateFormat = DateFormat('yyyy.MM.dd HH:mm:ss');
  final String dateString = dateFormat.format(datetime).split(' ')[0];
  try {
    return dateFormat.parse('$dateString $time');
  } catch (_) {
    return DateFormat('yyyy.MM.dd HH:mm').parse('$dateString $time');
  }
}

String intToTime(final int value) {
  final int minutes = value % 100;
  final int hour = (value - minutes) ~/ 100;

  return '${hour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:00';
}

int timeToInt(final String value) {
  final List<String> times = value.split(':');

  return int.parse(times[0]) * 100 + int.parse(times[1]);
}

DateTime stringToTime(String time, DateTime now) {
  DateTime dateTime = DateFormat('HH:mm').parse(time);

  /// Directly not retuning DateTime because, if only hh:mm given then
  /// the Year, Month and Date is considered as "1970-01-01" and TimeService
  /// returns today's date
  /// Hence we explicitly give year, month and day then return parsed DateTime
  return DateTime(now.year, now.month, now.day, dateTime.hour, dateTime.minute);
}

String replaceDoublesWithInts(final String value, [final int decimals = 1000]) {
  String result = value;
  final RegExp floatingNumberRegex = RegExp(r'[-+]?[0-9]+[.,][0-9]+');

  /// we search for all doubles inside of the string
  final List<Match> matches = floatingNumberRegex.allMatches(result).toList();
  for (final match in matches) {
    final String textNumber = match.group(0) ?? '';

    if (textNumber.isEmpty) {
      continue;
    }

    /// we replace ',' with '.' because when parsing to a number the
    /// method expects to find a '.', we then multiply
    /// the number by 1000, this will change all of our
    /// doubles with up to 3 decimals into ints
    final double number =
        (double.tryParse(textNumber.replaceAll(',', '.')) ?? 0) * decimals;

    /// we now replace all of the decimal numbers with their int
    /// counterparts
    if (number != 0) {
      result = result.replaceAll(textNumber, number.toInt().toString());
    }
  }

  return result;
}

String? formatTimeStampsDayHour(DateTime timestamp, String? localCode) {
  const String dateFormat = 'EEEE, hh:mm';
  final timeLabel = DateFormat(dateFormat, localCode).format(timestamp);
  return timeLabel;
}
