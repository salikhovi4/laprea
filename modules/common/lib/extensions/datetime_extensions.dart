extension MagnumDateTimeExtensions on DateTime {
  String getQuarterPresentation() {
    final quarter = (month - 1) ~/ 3 + 1;
    String quarterSymbol = 'I';
    if (quarter == 2) {
      quarterSymbol = 'II';
    } else if (quarter == 3) {
      quarterSymbol = 'III';
    } else if (quarter == 4) {
      quarterSymbol = 'IV';
    }

    return '$quarterSymbol Quarter $year';
  }
}
