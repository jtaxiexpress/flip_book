import 'l10n.dart';

/// The translations for Serbian (`sr`).
class L10nSr extends L10n {
  L10nSr([String locale = 'sr']) : super(locale);

  @override
  String get flipbook => 'Флипбоок';

  @override
  String get deleteFlipbook => 'Да ли желите да избришете овај Флипбоок?';

  @override
  String get loading => 'Учитавање ...';

  @override
  String get delete => 'Избрисати';

  @override
  String get cancel => 'Поништити, отказати';

  @override
  String get download => 'Преузимање';

  @override
  String get flipAnimation => 'Флип анимација';

  @override
  String get preview => 'Преглед';

  @override
  String get flipSpeed => 'Брзина окретања';

  @override
  String get successDownload => 'Преузми успех';

  @override
  String get error => 'Грешка у преузимање видеа';

  @override
  String get changeSpeed => 'Померите клизач да промените брзину.';

  @override
  String get notitle => 'без наслова';

  @override
  String get search => 'Претрага';

  @override
  String get noFlipbook => 'За сада нема Флипбоок-а.';

  @override
  String get title => 'Наслов Флипбооке';
}
