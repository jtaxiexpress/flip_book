import 'l10n.dart';

/// The translations for Amharic (`am`).
class L10nAm extends L10n {
  L10nAm([String locale = 'am']) : super(locale);

  @override
  String get flipbook => 'መጭመቂያ መጽሐፍ';

  @override
  String get deleteFlipbook => 'ይህንን የመጭመቂያ መጽሐፍት መሰረዝ ይፈልጋሉ?';

  @override
  String get loading => 'በመጫን ላይ ...';

  @override
  String get delete => 'ሰርዝ';

  @override
  String get cancel => 'ይቅር';

  @override
  String get download => 'አውርድ';

  @override
  String get flipAnimation => 'አኒሜሽን';

  @override
  String get preview => 'ቅድመ-እይታ';

  @override
  String get flipSpeed => 'የፍጥነት ፍጥነት';

  @override
  String get successDownload => 'ስኬት ያውርዱ';

  @override
  String get error => 'ቪዲዮን ማውረድ ስህተት';

  @override
  String get changeSpeed => 'ተንሸራታቹን ፍጥነት ወደ ለመቀየር ይውሰዱ.';

  @override
  String get notitle => 'ርዕስ የለም';

  @override
  String get search => 'ፍለጋ';

  @override
  String get noFlipbook => 'ለአሁኑ ምንም የሚሽጭቅ መጽሐፍ የለም.';

  @override
  String get title => 'የመፅሀፍ መጽሐፍ ርዕስ';
}
