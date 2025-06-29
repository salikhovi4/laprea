enum Currency {
  rub('\u20BD', '\u20BD'), // ₽
  rur('\u20BD', '\u20BD'), // ₽ до реформы 1998 года был код валюты 810, т.е. rur
  usd(r'$', r'$'),
  eur('\u20AC', '\u20AC'), // €
  jpy('\u00A5', '\u00A5'), // ¥
  cny('\u00A5', '\u00A5'), // ¥
  kzt('\u20B8', '\u20B8'), // ₸
  amd('\u058F', '\u058F'), // ֏
  uzs('UZS', 'UZS'), // нет символа
  aed('AED', 'AED'), // нет символа
  chf('\u20A3', '\u20A3'), // ₣
  gbp('\u00A3', '\u00A3'), // £
  turkish('\u20BA', '\u20BA'), // ₺
  idr('Rp', 'Rp '),
  undefined('', '');

  final String character;
  final String visibleCharacter;

  const Currency(this.character, this.visibleCharacter);
}

extension CurrencyExtension on String {
  Currency getCurrencyFromString() {
    return Currency.values.firstWhere(
      (e) => e.name.toString() == toLowerCase(),
      orElse: () => Currency.undefined,
    );
  }
}
