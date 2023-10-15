import 'l10n.dart';

/// The translations for Tagalog (`tl`).
class L10nTl extends L10n {
  L10nTl([String locale = 'tl']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Nais mo bang tanggalin ang flipbook na ito?';

  @override
  String get loading => 'Naglo -load ...';

  @override
  String get delete => 'Tanggalin';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get download => 'I -download';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'Preview';

  @override
  String get flipSpeed => 'Bilis ng flip';

  @override
  String get successDownload => 'Mag -download ng tagumpay';

  @override
  String get error => 'Error sa pag -download ng video';

  @override
  String get changeSpeed => 'Ilipat ang slider upang baguhin ang bilis.';

  @override
  String get notitle => 'walang titulo';

  @override
  String get search => 'Maghanap';

  @override
  String get noFlipbook => 'Walang flipbook para sa ngayon.';

  @override
  String get title => 'Pamagat ng Flipbook';
}
