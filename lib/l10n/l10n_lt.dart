import 'l10n.dart';

/// The translations for Lithuanian (`lt`).
class L10nLt extends L10n {
  L10nLt([String locale = 'lt']) : super(locale);

  @override
  String get flipbook => '„Flipbook“';

  @override
  String get deleteFlipbook => 'Ar norite ištrinti šią „flipbook“?';

  @override
  String get loading => 'Pakrovimas ...';

  @override
  String get delete => 'Ištrinti';

  @override
  String get cancel => 'Atšaukti';

  @override
  String get download => 'parsisiųsti';

  @override
  String get flipAnimation => '„Flip“ animacija';

  @override
  String get preview => 'Peržiūra';

  @override
  String get flipSpeed => 'Flip greitis';

  @override
  String get successDownload => 'Atsisiųskite sėkmę';

  @override
  String get error => 'Klaida atsisiunčiant vaizdo įrašą';

  @override
  String get changeSpeed => 'Perkelkite slankiklį, kad pakeistumėte greitį.';

  @override
  String get notitle => 'be pavadinimo';

  @override
  String get search => 'Paieška';

  @override
  String get noFlipbook => 'Kol kas nėra jokios knygos.';

  @override
  String get title => '„Flipbook“ pavadinimas';
}
