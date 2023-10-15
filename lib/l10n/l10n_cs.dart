import 'l10n.dart';

/// The translations for Czech (`cs`).
class L10nCs extends L10n {
  L10nCs([String locale = 'cs']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Chcete tento flipbook smazat?';

  @override
  String get loading => 'Načítání...';

  @override
  String get delete => 'Vymazat';

  @override
  String get cancel => 'zrušení';

  @override
  String get download => 'Stažení';

  @override
  String get flipAnimation => 'Animace převrácení';

  @override
  String get preview => 'Náhled';

  @override
  String get flipSpeed => 'Rychlost převrácení';

  @override
  String get successDownload => 'Stáhnout úspěch';

  @override
  String get error => 'Stahování chyby videa';

  @override
  String get changeSpeed => 'Přesuňte posuvník a změňte rychlost.';

  @override
  String get notitle => 'bez názvu';

  @override
  String get search => 'Vyhledávání';

  @override
  String get noFlipbook => 'Prozatím žádný flipbook.';

  @override
  String get title => 'Název flipbooku';
}
