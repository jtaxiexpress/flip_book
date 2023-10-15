import 'l10n.dart';

/// The translations for Albanian (`sq`).
class L10nSq extends L10n {
  L10nSq([String locale = 'sq']) : super(locale);

  @override
  String get flipbook => 'Libër me shirita';

  @override
  String get deleteFlipbook => 'A doni ta fshini këtë flipbook?';

  @override
  String get loading => 'Duke u ngarkuar ...';

  @override
  String get delete => 'Nxjerr';

  @override
  String get cancel => 'Anuloj';

  @override
  String get download => 'Shkarko';

  @override
  String get flipAnimation => 'Animacion';

  @override
  String get preview => 'Vrojtim';

  @override
  String get flipSpeed => 'Shpejtësi';

  @override
  String get successDownload => 'Shkarkoni suksesin';

  @override
  String get error => 'Gabim në shkarkimin e videos';

  @override
  String get changeSpeed => 'Lëvizni rrëshqitësin për të ndryshuar shpejtësinë.';

  @override
  String get notitle => 'pa titull';

  @override
  String get search => 'Kërkim';

  @override
  String get noFlipbook => 'Asnjë libër flipbook për tani.';

  @override
  String get title => 'Titulli i Flipbook';
}
