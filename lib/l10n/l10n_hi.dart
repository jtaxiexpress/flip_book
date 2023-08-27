import 'l10n.dart';

/// The translations for Hindi (`hi`).
class L10nHi extends L10n {
  L10nHi([String locale = 'hi']) : super(locale);

  @override
  String get flipbook => 'फ्लिप किताब';

  @override
  String get deleteFlipbook => 'क्या आप इस फ्लिपबुक को हटाना चाहते हैं?';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get delete => 'मिटाना';

  @override
  String get cancel => 'रद्द करना';

  @override
  String get download => 'डाउनलोड करना';

  @override
  String get flipAnimation => 'फ्लिप एनीमेशन';

  @override
  String get preview => 'पूर्व दर्शन';

  @override
  String get flipSpeed => 'चपटा गति';

  @override
  String get successDownload => 'सफलता डाउनलोड करें';

  @override
  String get error => 'वीडियो डाउनलोड करने में त्रुटि';

  @override
  String get changeSpeed => 'गति बदलने के लिए स्लाइडर को स्थानांतरित करें।';

  @override
  String get notitle => 'कोई शीर्षक नहीं';

  @override
  String get search => 'खोज';

  @override
  String get noFlipbook => 'अब के लिए कोई फ्लिपबुक नहीं।';

  @override
  String get title => 'फ्लिपबुक का शीर्षक';
}
