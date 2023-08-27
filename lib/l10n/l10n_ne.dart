import 'l10n.dart';

/// The translations for Nepali (`ne`).
class L10nNe extends L10n {
  L10nNe([String locale = 'ne']) : super(locale);

  @override
  String get flipbook => 'फ्लफबुक';

  @override
  String get deleteFlipbook => 'के तपाइँ यस फ्लिपबुक मेटाउन चाहानुहुन्छ?';

  @override
  String get loading => 'लोड गर्दै ...';

  @override
  String get delete => 'मेटाउन';

  @override
  String get cancel => 'रद्द गर्नु';

  @override
  String get download => 'डाउनलोड गर्नुहोस्';

  @override
  String get flipAnimation => 'फ्लिप एनिमेसन';

  @override
  String get preview => 'पुर्व अवलोकन';

  @override
  String get flipSpeed => 'फ्लिप गति';

  @override
  String get successDownload => 'डाउनलोड गर्न';

  @override
  String get error => 'भिडियो डाउनलोड गर्न त्रुटि';

  @override
  String get changeSpeed => 'स्लाइडरलाई गति परिवर्तन गर्न सार्नुहोस्।';

  @override
  String get notitle => 'कुनै शीर्षक छैन';

  @override
  String get search => 'खोजी';

  @override
  String get noFlipbook => 'अहिलेको लागि फ्लिपबुक छैन।';

  @override
  String get title => 'फ्लिपबुकको शीर्षक';
}
