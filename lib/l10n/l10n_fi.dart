import 'l10n.dart';

/// The translations for Finnish (`fi`).
class L10nFi extends L10n {
  L10nFi([String locale = 'fi']) : super(locale);

  @override
  String get flipbook => 'Fripbook';

  @override
  String get deleteFlipbook => 'Haluatko poistaa tämän flipbook?';

  @override
  String get loading => 'Ladataan...';

  @override
  String get delete => 'Poistaa';

  @override
  String get cancel => 'Peruuttaa';

  @override
  String get download => 'ladata';

  @override
  String get flipAnimation => 'Kääntöanimaatio';

  @override
  String get preview => 'Esikatselu';

  @override
  String get flipSpeed => 'Kääntönopeus';

  @override
  String get successDownload => 'Lataa menestys';

  @override
  String get error => 'Videon lataaminen';

  @override
  String get changeSpeed => 'Siirrä liukusäädin nopeuden vaihtamiseksi.';

  @override
  String get notitle => 'ei otsikkoa';

  @override
  String get search => 'Hae';

  @override
  String get noFlipbook => 'Ei nyt flipbookia.';

  @override
  String get title => 'Flipbook -otsikko';
}
