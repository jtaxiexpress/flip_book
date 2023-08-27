import 'l10n.dart';

/// The translations for Latvian (`lv`).
class L10nLv extends L10n {
  L10nLv([String locale = 'lv']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Vai vēlaties izdzēst šo flipbook?';

  @override
  String get loading => 'Iekraušana ...';

  @override
  String get delete => 'Dzēst';

  @override
  String get cancel => 'Atcelt';

  @override
  String get download => 'Lejupielādēt';

  @override
  String get flipAnimation => 'Flip animācija';

  @override
  String get preview => 'Priekšskatījums';

  @override
  String get flipSpeed => 'Uzsist ātrumu';

  @override
  String get successDownload => 'Lejupielādēt panākumus';

  @override
  String get error => 'Kļūda lejupielādē video';

  @override
  String get changeSpeed => 'Pārvietojiet slīdni, lai mainītu ātrumu.';

  @override
  String get notitle => 'nav nosaukuma';

  @override
  String get search => 'Meklēt';

  @override
  String get noFlipbook => 'Pagaidām nav flipbook.';

  @override
  String get title => 'Flipbook nosaukums';
}
