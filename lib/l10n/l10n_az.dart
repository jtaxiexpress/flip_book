import 'l10n.dart';

/// The translations for Azerbaijani (`az`).
class L10nAz extends L10n {
  L10nAz([String locale = 'az']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Bu flipbook silmək istəyirsiniz?';

  @override
  String get loading => 'Yükləmə ...';

  @override
  String get delete => 'Silmək';

  @override
  String get cancel => 'Ləğv etmək';

  @override
  String get download => 'Download';

  @override
  String get flipAnimation => 'Flip animasiya';

  @override
  String get preview => 'Önizləmə';

  @override
  String get flipSpeed => 'Sürüşmək';

  @override
  String get successDownload => 'Uğur yükləyin';

  @override
  String get error => 'VİDEO Yükləmə xətası';

  @override
  String get changeSpeed => 'Sürəti dəyişdirmək üçün sürüşmə hərəkət edin.';

  @override
  String get notitle => 'başlıq';

  @override
  String get search => 'Axtarış';

  @override
  String get noFlipbook => 'Artıq Flipbook yoxdur.';

  @override
  String get title => 'FlipBook başlığı';
}
