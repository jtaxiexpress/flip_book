import 'l10n.dart';

/// The translations for Slovenian (`sl`).
class L10nSl extends L10n {
  L10nSl([String locale = 'sl']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Ali želite izbrisati ta flipbook?';

  @override
  String get loading => 'Nalaganje...';

  @override
  String get delete => 'Izbrisati';

  @override
  String get cancel => 'Odpovedati';

  @override
  String get download => 'Prenesi';

  @override
  String get flipAnimation => 'Flip animacija';

  @override
  String get preview => 'Predogled';

  @override
  String get flipSpeed => 'Hitrost';

  @override
  String get successDownload => 'Prenos uspeha';

  @override
  String get error => 'Napaka pri prenosu videoposnetka';

  @override
  String get changeSpeed => 'Premaknite drsnik na hitrost spreminjanja.';

  @override
  String get notitle => 'Brez naslova';

  @override
  String get search => 'Iskanje';

  @override
  String get noFlipbook => 'Za zdaj ni nobenega flipbook -a.';

  @override
  String get title => 'Naslov flipbook -a';
}
