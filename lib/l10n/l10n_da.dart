import 'l10n.dart';

/// The translations for Danish (`da`).
class L10nDa extends L10n {
  L10nDa([String locale = 'da']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Vil du slette denne flipbog?';

  @override
  String get loading => 'Indlæser...';

  @override
  String get delete => 'Slet';

  @override
  String get cancel => 'Afbestille';

  @override
  String get download => 'Hent';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'Preview';

  @override
  String get flipSpeed => 'Vend hastighed';

  @override
  String get successDownload => 'Download succes';

  @override
  String get error => 'Fejl ved download af video';

  @override
  String get changeSpeed => 'Flyt skyderen for at ændre hastighed.';

  @override
  String get notitle => 'ingen titel';

  @override
  String get search => 'Søg';

  @override
  String get noFlipbook => 'Ingen flipbook for nu.';

  @override
  String get title => 'Flipbooks titel';
}
