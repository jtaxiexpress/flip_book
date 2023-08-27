import 'l10n.dart';

/// The translations for Slovak (`sk`).
class L10nSk extends L10n {
  L10nSk([String locale = 'sk']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Chcete odstrániť tento flipbook?';

  @override
  String get loading => 'Načítava...';

  @override
  String get delete => 'Vymazať';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get download => 'Stiahnuť ▼';

  @override
  String get flipAnimation => 'Animácia';

  @override
  String get preview => 'Náhľad';

  @override
  String get flipSpeed => 'Rýchlosť';

  @override
  String get successDownload => 'Úspech sťahovania';

  @override
  String get error => 'Sťahovanie videa';

  @override
  String get changeSpeed => 'Presuňte posúvač, aby ste zmenili rýchlosť.';

  @override
  String get notitle => 'bez nadpisu';

  @override
  String get search => 'Vyhľadávanie';

  @override
  String get noFlipbook => 'Zatiaľ žiadny flipbook.';

  @override
  String get title => 'Titul flipbooku';
}
