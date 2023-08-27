import 'l10n.dart';

/// The translations for Turkish (`tr`).
class L10nTr extends L10n {
  L10nTr([String locale = 'tr']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Bu flipbook\'u silmek ister misiniz?';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get delete => 'Silmek';

  @override
  String get cancel => 'İptal etmek';

  @override
  String get download => 'İndirmek';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'Ön izleme';

  @override
  String get flipSpeed => 'Flip hızı';

  @override
  String get successDownload => 'Başarıyı İndir';

  @override
  String get error => 'Video indirme hatası';

  @override
  String get changeSpeed => 'Hızı değiştirmek için kaydırıcıyı hareket ettirin.';

  @override
  String get notitle => 'Başlık yok';

  @override
  String get search => 'Aramak';

  @override
  String get noFlipbook => 'Şimdilik flipbook yok.';

  @override
  String get title => 'Flipbook\'un başlığı';
}
