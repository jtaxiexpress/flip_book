import 'l10n.dart';

/// The translations for Arabic (`ar`).
class L10nAr extends L10n {
  L10nAr([String locale = 'ar']) : super(locale);

  @override
  String get flipbook => 'فليبوك';

  @override
  String get deleteFlipbook => 'هل تريد حذف هذا الكتاب؟';

  @override
  String get loading => 'تحميل...';

  @override
  String get delete => 'يمسح';

  @override
  String get cancel => 'يلغي';

  @override
  String get download => 'تحميل';

  @override
  String get flipAnimation => 'انقلب الرسوم المتحركة';

  @override
  String get preview => 'معاينة';

  @override
  String get flipSpeed => 'سرعة الوجه';

  @override
  String get successDownload => 'تنزيل النجاح';

  @override
  String get error => 'خطأ تنزيل الفيديو';

  @override
  String get changeSpeed => 'نقل شريط التمرير لتغيير السرعة.';

  @override
  String get notitle => 'بلا عنوان';

  @override
  String get search => 'يبحث';

  @override
  String get noFlipbook => 'لا يوجد فليب في الوقت الحالي.';

  @override
  String get title => 'عنوان Flipbook';
}
