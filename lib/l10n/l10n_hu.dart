import 'l10n.dart';

/// The translations for Hungarian (`hu`).
class L10nHu extends L10n {
  L10nHu([String locale = 'hu']) : super(locale);

  @override
  String get flipbook => 'Kócáskönyv';

  @override
  String get deleteFlipbook => 'Szeretné törölni ezt a flipbookot?';

  @override
  String get loading => 'Betöltés...';

  @override
  String get delete => 'Töröl';

  @override
  String get cancel => 'Megszünteti';

  @override
  String get download => 'Letöltés';

  @override
  String get flipAnimation => 'Flip animáció';

  @override
  String get preview => 'Előnézet';

  @override
  String get flipSpeed => 'Flipsebesség';

  @override
  String get successDownload => 'Letöltés siker';

  @override
  String get error => 'Hiba a videó letöltése';

  @override
  String get changeSpeed => 'Mozgassa a csúszkát a sebesség megváltoztatásához.';

  @override
  String get notitle => 'nincs cím';

  @override
  String get search => 'Keresés';

  @override
  String get noFlipbook => 'Egyelőre nincs Flipbook.';

  @override
  String get title => 'Flipbook címe';
}
