import 'l10n.dart';

/// The translations for Bengali Bangla (`bn`).
class L10nBn extends L10n {
  L10nBn([String locale = 'bn']) : super(locale);

  @override
  String get flipbook => 'উল্টানো বই';

  @override
  String get deleteFlipbook => 'আপনি কি এই ফ্লিপবুকটি মুছতে চান?';

  @override
  String get loading => 'লোড হচ্ছে ...';

  @override
  String get delete => 'মুছে ফেলা';

  @override
  String get cancel => 'বাতিল';

  @override
  String get download => 'ডাউনলোড';

  @override
  String get flipAnimation => 'ফ্লিপ অ্যানিমেশন';

  @override
  String get preview => 'পূর্বরূপ';

  @override
  String get flipSpeed => 'ফ্লিপ গতি';

  @override
  String get successDownload => 'সাফল্য ডাউনলোড করুন';

  @override
  String get error => 'ভিডিও ডাউনলোড করতে ত্রুটি';

  @override
  String get changeSpeed => 'গতি পরিবর্তন করতে স্লাইডারটি সরান।';

  @override
  String get notitle => 'কোনো শিরোনাম নেই';

  @override
  String get search => 'অনুসন্ধান';

  @override
  String get noFlipbook => 'আপাতত কোনও ফ্লিপবুক নেই।';

  @override
  String get title => 'ফ্লিপবুকের শিরোনাম';
}
