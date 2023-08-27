import 'l10n.dart';

/// The translations for Romanian Moldavian Moldovan (`ro`).
class L10nRo extends L10n {
  L10nRo([String locale = 'ro']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Vrei să ștergi acest flipbook?';

  @override
  String get loading => 'Se încarcă...';

  @override
  String get delete => 'Șterge';

  @override
  String get cancel => 'Anulare';

  @override
  String get download => 'Descarca';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'previzualizare';

  @override
  String get flipSpeed => 'Viteza de flip';

  @override
  String get successDownload => 'Descărcați succesul';

  @override
  String get error => 'Eroare la descărcarea video';

  @override
  String get changeSpeed => 'Mutați glisorul pentru a schimba viteza.';

  @override
  String get notitle => 'fara titlu';

  @override
  String get search => 'Căutare';

  @override
  String get noFlipbook => 'Nu există flipbook deocamdată.';

  @override
  String get title => 'Titlul lui Flipbook';
}
