import 'l10n.dart';

/// The translations for Mongolian (`mn`).
class L10nMn extends L10n {
  L10nMn([String locale = 'mn']) : super(locale);

  @override
  String get flipbook => 'Эргэлтийн зураг';

  @override
  String get deleteFlipbook => 'Та энэ флипкийг устгахыг хүсч байна уу?';

  @override
  String get loading => 'Ачаалах ...';

  @override
  String get delete => 'Эдгээх';

  @override
  String get cancel => 'Цуаах';

  @override
  String get download => 'Татаж авах';

  @override
  String get flipAnimation => 'Шилжих хөдөлгөөнт дүрс';

  @override
  String get preview => 'Киноны урөдчилсан үзлэг';

  @override
  String get flipSpeed => 'Урсгал хурд';

  @override
  String get successDownload => 'Амжилтанд хүрэх';

  @override
  String get error => 'Видеог татаж авахад алдаа гарлаа';

  @override
  String get changeSpeed => 'Хурдыг өөрчлөхийн тулд гулсагчийг хөдөлгө.';

  @override
  String get notitle => 'гарын үсэг алга';

  @override
  String get search => 'Эрэл хайгуул хийх';

  @override
  String get noFlipbook => 'Одоо flipbook байхгүй байна.';

  @override
  String get title => 'Флипбэкийн гарчиг';
}
