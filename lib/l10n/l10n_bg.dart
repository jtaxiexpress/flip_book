import 'l10n.dart';

/// The translations for Bulgarian (`bg`).
class L10nBg extends L10n {
  L10nBg([String locale = 'bg']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Искате ли да изтриете този флипбук?';

  @override
  String get loading => 'Зареждане...';

  @override
  String get delete => 'Изтрий';

  @override
  String get cancel => 'Отказ';

  @override
  String get download => 'Изтегли';

  @override
  String get flipAnimation => 'Флип анимация';

  @override
  String get preview => 'Визуализация';

  @override
  String get flipSpeed => 'Флип скорост';

  @override
  String get successDownload => 'Изтеглете успеха';

  @override
  String get error => 'Грешка за изтегляне на видео';

  @override
  String get changeSpeed => 'Преместете плъзгача, за да промените скоростта.';

  @override
  String get notitle => 'Без заглавие';

  @override
  String get search => 'Търсене';

  @override
  String get noFlipbook => 'Засега няма FlipBook.';

  @override
  String get title => 'Заглавието на Flipbook';
}
