import 'l10n.dart';

/// The translations for Hebrew (`he`).
class L10nHe extends L10n {
  L10nHe([String locale = 'he']) : super(locale);

  @override
  String get flipbook => 'ספר פליפ';

  @override
  String get deleteFlipbook => 'האם אתה רוצה למחוק את ספר ההפליא הזה?';

  @override
  String get loading => 'טוען...';

  @override
  String get delete => 'לִמְחוֹק';

  @override
  String get cancel => 'לְבַטֵל';

  @override
  String get download => 'הורד';

  @override
  String get flipAnimation => 'אנימציה הפוך';

  @override
  String get preview => 'תצוגה מקדימה';

  @override
  String get flipSpeed => 'מהירות הפוך';

  @override
  String get successDownload => 'הורד הצלחה';

  @override
  String get error => 'שגיאה בהורדת וידאו';

  @override
  String get changeSpeed => 'העבירו את המחוון לשינוי מהירות.';

  @override
  String get notitle => 'ללא כותרת';

  @override
  String get search => 'לחפש';

  @override
  String get noFlipbook => 'אין פנקס פנקס לעת עתה.';

  @override
  String get title => 'הכותרת של Flipbook';
}
