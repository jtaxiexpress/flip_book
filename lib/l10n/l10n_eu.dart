import 'l10n.dart';

/// The translations for Basque (`eu`).
class L10nEu extends L10n {
  L10nEu([String locale = 'eu']) : super(locale);

  @override
  String get flipbook => 'Fitxa';

  @override
  String get deleteFlipbook => 'Flipbook hau ezabatu nahi al duzu?';

  @override
  String get loading => 'Kargatzen ...';

  @override
  String get delete => 'Ezabatu';

  @override
  String get cancel => 'Indargabetu';

  @override
  String get download => 'Desengopen';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'Aurrerapen';

  @override
  String get flipSpeed => 'Irauli abiadura';

  @override
  String get successDownload => 'Deskargatu arrakasta';

  @override
  String get error => 'Errorea bideoa deskargatzean';

  @override
  String get changeSpeed => 'Eraman graduatzailea abiadura aldatzeko.';

  @override
  String get notitle => 'Izenbururik ez';

  @override
  String get search => 'Araketa';

  @override
  String get noFlipbook => 'Oraingoz ez da fitxa.';

  @override
  String get title => 'Flipbook-en izenburua';
}
