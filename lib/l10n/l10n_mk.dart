import 'l10n.dart';

/// The translations for Macedonian (`mk`).
class L10nMk extends L10n {
  L10nMk([String locale = 'mk']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Дали сакате да го избришете овој флип -книга?';

  @override
  String get loading => 'Вчитување ...';

  @override
  String get delete => 'Избриши';

  @override
  String get cancel => 'Откажи';

  @override
  String get download => 'Преземете';

  @override
  String get flipAnimation => 'Флип анимација';

  @override
  String get preview => 'Преглед';

  @override
  String get flipSpeed => 'Брзина на флип';

  @override
  String get successDownload => 'Преземете успех';

  @override
  String get error => 'Грешка во преземањето видео';

  @override
  String get changeSpeed => 'Поместете го лизгачот за да ја промените брзината.';

  @override
  String get notitle => 'нема наслов';

  @override
  String get search => 'Пребарување';

  @override
  String get noFlipbook => 'Засега нема флип -книга.';

  @override
  String get title => 'Наслов на Flipbook';
}
