import 'l10n.dart';

/// The translations for Persian (`fa`).
class L10nFa extends L10n {
  L10nFa([String locale = 'fa']) : super(locale);

  @override
  String get flipbook => 'کتاب';

  @override
  String get deleteFlipbook => 'آیا می خواهید این flipbook را حذف کنید؟';

  @override
  String get loading => 'بارگذاری...';

  @override
  String get delete => 'حذف';

  @override
  String get cancel => 'لغو کردن';

  @override
  String get download => 'دانلود';

  @override
  String get flipAnimation => 'انیمیشن تلنگر';

  @override
  String get preview => 'پیش نمایش';

  @override
  String get flipSpeed => 'سرعت تلنگر';

  @override
  String get successDownload => 'موفقیت را بارگیری کنید';

  @override
  String get error => 'خطا در حال بارگیری ویدیو';

  @override
  String get changeSpeed => 'کشویی را حرکت دهید تا سرعت تغییر کند.';

  @override
  String get notitle => 'بدون عنوان';

  @override
  String get search => 'جستجو کردن';

  @override
  String get noFlipbook => 'در حال حاضر بدون فلیپ بوک.';

  @override
  String get title => 'عنوان Flipbook';
}
