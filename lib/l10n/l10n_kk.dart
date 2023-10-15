import 'l10n.dart';

/// The translations for Kazakh (`kk`).
class L10nKk extends L10n {
  L10nKk([String locale = 'kk']) : super(locale);

  @override
  String get flipbook => 'Флипсика';

  @override
  String get deleteFlipbook => 'Сіз бұл флипбукты жойғыңыз келе ме?';

  @override
  String get loading => 'Жүктеу ...';

  @override
  String get delete => 'Жою';

  @override
  String get cancel => 'Күшін жою';

  @override
  String get download => 'Сайлау';

  @override
  String get flipAnimation => 'Флип-анимация';

  @override
  String get preview => 'Алдын-ала қарау';

  @override
  String get flipSpeed => 'Жылдамдық';

  @override
  String get successDownload => 'Сәттілік жүктеу';

  @override
  String get error => 'Бейнені жүктеу кезінде қате пайда болды';

  @override
  String get changeSpeed => 'Жылдамдықты өзгерту үшін жүгірткіні жылжытыңыз.';

  @override
  String get notitle => 'Тақырып жоқ';

  @override
  String get search => 'Іздеу';

  @override
  String get noFlipbook => 'Енді флипсова жоқ.';

  @override
  String get title => 'Флипсбук атауы';
}
