import 'l10n.dart';

/// The translations for Urdu (`ur`).
class L10nUr extends L10n {
  L10nUr([String locale = 'ur']) : super(locale);

  @override
  String get flipbook => 'فلپ بک';

  @override
  String get deleteFlipbook => 'کیا آپ اس فلپ بک کو حذف کرنا چاہتے ہیں؟';

  @override
  String get loading => 'لوڈنگ ...';

  @override
  String get delete => 'حذف کریں';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get download => 'ڈاؤن لوڈ کریں';

  @override
  String get flipAnimation => 'پلٹائیں حرکت پذیری';

  @override
  String get preview => 'پیش نظارہ';

  @override
  String get flipSpeed => 'پلٹائیں کی رفتار';

  @override
  String get successDownload => 'کامیابی ڈاؤن لوڈ کریں';

  @override
  String get error => 'ویڈیو ڈاؤن لوڈ کرنے میں خرابی';

  @override
  String get changeSpeed => 'رفتار کو تبدیل کرنے کے لئے سلائیڈر کو منتقل کریں۔';

  @override
  String get notitle => 'بلا عنوان';

  @override
  String get search => 'تلاش';

  @override
  String get noFlipbook => 'ابھی کے لئے کوئی فلپ بک نہیں ہے۔';

  @override
  String get title => 'فلپ بک کا عنوان';
}
