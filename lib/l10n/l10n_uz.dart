import 'l10n.dart';

/// The translations for Uzbek (`uz`).
class L10nUz extends L10n {
  L10nUz([String locale = 'uz']) : super(locale);

  @override
  String get flipbook => 'Fliplav';

  @override
  String get deleteFlipbook => 'Ushbu flipkushni o\'chirmoqchimisiz?';

  @override
  String get loading => 'Yuklash ...';

  @override
  String get delete => 'O\'chirmoq';

  @override
  String get cancel => 'Bekor qilmoq';

  @override
  String get download => 'Yuklab olish';

  @override
  String get flipAnimation => 'Flip animatsiya';

  @override
  String get preview => 'Oldindan ko\'rish';

  @override
  String get flipSpeed => 'Flip tezligi';

  @override
  String get successDownload => 'Muvaffaqiyat';

  @override
  String get error => 'Videoni yuklab olishda xato';

  @override
  String get changeSpeed => 'Tezlikni o\'zgartirish uchun slayderni harakatlantiring.';

  @override
  String get notitle => 'Sarlavha yo\'q';

  @override
  String get search => 'Qidirmoq';

  @override
  String get noFlipbook => 'Hozirda fliplav yo\'q.';

  @override
  String get title => 'Flipbookning sarlavhasi';
}
