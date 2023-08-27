import 'l10n.dart';

/// The translations for Icelandic (`is`).
class L10nIs extends L10n {
  L10nIs([String locale = 'is']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Viltu eyða þessari flipbook?';

  @override
  String get loading => 'Hleðsla ...';

  @override
  String get delete => 'Eyða';

  @override
  String get cancel => 'Hætta við';

  @override
  String get download => 'Sækja';

  @override
  String get flipAnimation => 'FLIP FYRIRTÆKI';

  @override
  String get preview => 'Forsýning';

  @override
  String get flipSpeed => 'Fletta hraða';

  @override
  String get successDownload => 'Niðurhal árangur';

  @override
  String get error => 'Villa við að hlaða niður myndbandi';

  @override
  String get changeSpeed => 'Færðu rennibrautina til að breyta hraða.';

  @override
  String get notitle => 'Enginn titill';

  @override
  String get search => 'Leitaðu';

  @override
  String get noFlipbook => 'Engin flipbook í bili.';

  @override
  String get title => 'Titill FlipBook';
}
