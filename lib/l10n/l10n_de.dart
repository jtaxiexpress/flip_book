import 'l10n.dart';

/// The translations for German (`de`).
class L10nDe extends L10n {
  L10nDe([String locale = 'de']) : super(locale);

  @override
  String get flipbook => 'Daumenkino';

  @override
  String get deleteFlipbook => 'Möchten Sie dieses Flipbook löschen?';

  @override
  String get loading => 'Wird geladen...';

  @override
  String get delete => 'Löschen';

  @override
  String get cancel => 'Stornieren';

  @override
  String get download => 'Herunterladen';

  @override
  String get flipAnimation => 'Flip -Animation';

  @override
  String get preview => 'Vorschau';

  @override
  String get flipSpeed => 'Flip-Geschwindigkeit';

  @override
  String get successDownload => 'Erfolg herunterladen';

  @override
  String get error => 'Fehler beim Herunterladen von Video';

  @override
  String get changeSpeed => 'Bewegen Sie den Schieberegler, um die Geschwindigkeit zu ändern.';

  @override
  String get notitle => 'kein Titel';

  @override
  String get search => 'Suchen';

  @override
  String get noFlipbook => 'Fürs Erste kein Flipbook.';

  @override
  String get title => 'Title des Flipbooks';
}
