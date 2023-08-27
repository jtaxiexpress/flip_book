import 'l10n.dart';

/// The translations for Croatian (`hr`).
class L10nHr extends L10n {
  L10nHr([String locale = 'hr']) : super(locale);

  @override
  String get flipbook => 'Okrenuti knjigu';

  @override
  String get deleteFlipbook => 'Želite li izbrisati ovaj flipbook?';

  @override
  String get loading => 'Učitavam...';

  @override
  String get delete => 'Izbrisati';

  @override
  String get cancel => 'Otkazati';

  @override
  String get download => 'preuzimanje datoteka';

  @override
  String get flipAnimation => 'Flip animacija';

  @override
  String get preview => 'Pregled';

  @override
  String get flipSpeed => 'Brzina okretanja';

  @override
  String get successDownload => 'Preuzmite uspjeh';

  @override
  String get error => 'Pogreška Preuzimanje videozapisa';

  @override
  String get changeSpeed => 'Pomaknite klizač da biste promijenili brzinu.';

  @override
  String get notitle => 'bez naslova';

  @override
  String get search => 'traži';

  @override
  String get noFlipbook => 'Zasad nema flipbook -a.';

  @override
  String get title => 'Naslov Flipbooka';
}
