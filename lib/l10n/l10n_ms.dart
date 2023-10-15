import 'l10n.dart';

/// The translations for Malay (`ms`).
class L10nMs extends L10n {
  L10nMs([String locale = 'ms']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Adakah anda mahu memadamkan buku ini?';

  @override
  String get loading => 'Memuatkan ...';

  @override
  String get delete => 'Padam';

  @override
  String get cancel => 'Batalkan';

  @override
  String get download => 'Muat turun';

  @override
  String get flipAnimation => 'Animasi flip';

  @override
  String get preview => 'Pratonton';

  @override
  String get flipSpeed => 'Kelajuan flip';

  @override
  String get successDownload => 'Muat turun kejayaan';

  @override
  String get error => 'Ralat memuat turun video';

  @override
  String get changeSpeed => 'Gerakkan gelangsar untuk menukar kelajuan.';

  @override
  String get notitle => 'tiada tajuk';

  @override
  String get search => 'Cari';

  @override
  String get noFlipbook => 'Tiada buku flip untuk sekarang.';

  @override
  String get title => 'Tajuk flipbook';
}
