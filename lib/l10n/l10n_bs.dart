import 'l10n.dart';

/// The translations for Bosnian (`bs`).
class L10nBs extends L10n {
  L10nBs([String locale = 'bs']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Želite li izbrisati ovaj flipbook?';

  @override
  String get loading => 'Učitavanje...';

  @override
  String get delete => 'Izbrisati';

  @override
  String get cancel => 'Otkazati';

  @override
  String get download => 'Skinuti';

  @override
  String get flipAnimation => 'Flip animacija';

  @override
  String get preview => 'Pregled';

  @override
  String get flipSpeed => 'Brzina prelaska';

  @override
  String get successDownload => 'Preuzmi uspjeh';

  @override
  String get error => 'Pogreška prilikom preuzimanja videa';

  @override
  String get changeSpeed => 'Pomaknite klizač za promjenu brzine.';

  @override
  String get notitle => 'Nema naslova';

  @override
  String get search => 'Pretražiti';

  @override
  String get noFlipbook => 'Za sada nema flipbook-a.';

  @override
  String get title => 'Naslov flipbooka';
}
