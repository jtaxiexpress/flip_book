import 'l10n.dart';

/// The translations for Swedish (`sv`).
class L10nSv extends L10n {
  L10nSv([String locale = 'sv']) : super(locale);

  @override
  String get flipbook => 'Blädderbok';

  @override
  String get deleteFlipbook => 'Vill du ta bort den här flipbooken?';

  @override
  String get loading => 'Läser in...';

  @override
  String get delete => 'Radera';

  @override
  String get cancel => 'Annullera';

  @override
  String get download => 'Ladda ner';

  @override
  String get flipAnimation => 'Vända animering';

  @override
  String get preview => 'Förhandsvisning';

  @override
  String get flipSpeed => 'Vända hastighet';

  @override
  String get successDownload => 'Ladda ner framgång';

  @override
  String get error => 'Felnedladdning av video';

  @override
  String get changeSpeed => 'Flytta skjutreglaget för att ändra hastighet.';

  @override
  String get notitle => 'ingen titel';

  @override
  String get search => 'Sök';

  @override
  String get noFlipbook => 'Ingen flipbook för nu.';

  @override
  String get title => 'Flipbooks titel';
}
