import 'l10n.dart';

/// The translations for Indonesian (`id`).
class L10nId extends L10n {
  L10nId([String locale = 'id']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Apakah Anda ingin menghapus flipbook ini?';

  @override
  String get loading => 'Memuat...';

  @override
  String get delete => 'Menghapus';

  @override
  String get cancel => 'Membatalkan';

  @override
  String get download => 'Unduh';

  @override
  String get flipAnimation => 'Balik animasi';

  @override
  String get preview => 'Pratinjau';

  @override
  String get flipSpeed => 'Kecepatan balik';

  @override
  String get successDownload => 'Unduh kesuksesan';

  @override
  String get error => 'Kesalahan mengunduh video';

  @override
  String get changeSpeed => 'Pindahkan slider untuk mengubah kecepatan.';

  @override
  String get notitle => 'tanpa judul';

  @override
  String get search => 'Mencari';

  @override
  String get noFlipbook => 'Tidak ada flipbook untuk saat ini.';

  @override
  String get title => 'Judul Flipbook';
}
