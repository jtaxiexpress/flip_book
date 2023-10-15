import 'l10n.dart';

/// The translations for Dutch Flemish (`nl`).
class L10nNl extends L10n {
  L10nNl([String locale = 'nl']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Wil je dit flipbook verwijderen?';

  @override
  String get loading => 'Bezig met laden...';

  @override
  String get delete => 'Verwijderen';

  @override
  String get cancel => 'Annuleren';

  @override
  String get download => 'Downloaden';

  @override
  String get flipAnimation => 'Flip -animatie';

  @override
  String get preview => 'Voorbeeld';

  @override
  String get flipSpeed => 'Omslagsnelheid';

  @override
  String get successDownload => 'Download succes';

  @override
  String get error => 'Fout bij het downloaden van video';

  @override
  String get changeSpeed => 'Verplaats de schuifregelaar om snelheid te veranderen.';

  @override
  String get notitle => 'geen titel';

  @override
  String get search => 'Zoekopdracht';

  @override
  String get noFlipbook => 'Geen flipbook voor nu.';

  @override
  String get title => 'Flipbook\'s titel';
}
