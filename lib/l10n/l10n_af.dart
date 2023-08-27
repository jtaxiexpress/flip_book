import 'l10n.dart';

/// The translations for Afrikaans (`af`).
class L10nAf extends L10n {
  L10nAf([String locale = 'af']) : super(locale);

  @override
  String get flipbook => 'Flipboek';

  @override
  String get deleteFlipbook => 'Wil u hierdie flipboek uitvee?';

  @override
  String get loading => 'Laai ...';

  @override
  String get delete => 'Verwyder';

  @override
  String get cancel => 'Kanselleer';

  @override
  String get download => 'Aflaai';

  @override
  String get flipAnimation => 'Flip animasie';

  @override
  String get preview => 'Voorskou';

  @override
  String get flipSpeed => 'Flipsnelheid';

  @override
  String get successDownload => 'Laai sukses af';

  @override
  String get error => 'Fout aflaai video';

  @override
  String get changeSpeed => 'Beweeg die skuifknop om die spoed te verander.';

  @override
  String get notitle => 'Geen titel nie';

  @override
  String get search => 'Soek';

  @override
  String get noFlipbook => 'Geen flipboek vir eers nie.';

  @override
  String get title => 'Flipbook se titel';
}
