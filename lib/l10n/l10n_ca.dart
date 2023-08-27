import 'l10n.dart';

/// The translations for Catalan Valencian (`ca`).
class L10nCa extends L10n {
  L10nCa([String locale = 'ca']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Voleu suprimir aquest flipbook?';

  @override
  String get loading => 'Carregant ...';

  @override
  String get delete => 'Esborrar';

  @override
  String get cancel => 'Cancel · lar';

  @override
  String get download => 'descarregar';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'Vista prèvia';

  @override
  String get flipSpeed => 'Velocitat';

  @override
  String get successDownload => 'Descarregueu l\'èxit';

  @override
  String get error => 'Error de descàrrega de vídeo';

  @override
  String get changeSpeed => 'Desplaceu el control lliscant per canviar la velocitat.';

  @override
  String get notitle => 'Sense títol';

  @override
  String get search => 'Cerca';

  @override
  String get noFlipbook => 'No hi ha cap flipbook per ara.';

  @override
  String get title => 'El títol de FlipBook';
}
