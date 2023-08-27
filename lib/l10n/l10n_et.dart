import 'l10n.dart';

/// The translations for Estonian (`et`).
class L10nEt extends L10n {
  L10nEt([String locale = 'et']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Kas soovite selle flipbooki kustutada?';

  @override
  String get loading => 'Laadimine ...';

  @override
  String get delete => 'Kustutama';

  @override
  String get cancel => 'Tühistama';

  @override
  String get download => 'Lae alla';

  @override
  String get flipAnimation => 'Klapp -animatsioon';

  @override
  String get preview => 'Eelvaade';

  @override
  String get flipSpeed => 'Klappkiirus';

  @override
  String get successDownload => 'Edu allalaadimine';

  @override
  String get error => 'Viga video allalaadimine';

  @override
  String get changeSpeed => 'Liigutage liugurit kiiruse muutmiseks.';

  @override
  String get notitle => 'pole pealkirja';

  @override
  String get search => 'Otsing';

  @override
  String get noFlipbook => 'Praegu pole flipbooki.';

  @override
  String get title => 'Flipbooki pealkiri';
}
