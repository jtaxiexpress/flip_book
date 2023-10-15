import 'l10n.dart';

/// The translations for Belarusian (`be`).
class L10nBe extends L10n {
  L10nBe([String locale = 'be']) : super(locale);

  @override
  String get flipbook => 'Фліп кніг';

  @override
  String get deleteFlipbook => 'Вы хочаце выдаліць гэты FlipBook?';

  @override
  String get loading => 'Загрузка ...';

  @override
  String get delete => 'Выдаляць';

  @override
  String get cancel => 'Ануляваць';

  @override
  String get download => 'Загрузка';

  @override
  String get flipAnimation => 'Фліп -анімацыя';

  @override
  String get preview => 'Папярэдні прагляд';

  @override
  String get flipSpeed => 'Хуткасць перавярніце';

  @override
  String get successDownload => 'Спампаваць поспех';

  @override
  String get error => 'Памылка Загрузка відэа';

  @override
  String get changeSpeed => 'Перамясціце паўзунок, каб змяніць хуткасць.';

  @override
  String get notitle => 'Няма загалоўка';

  @override
  String get search => 'Шукаць';

  @override
  String get noFlipbook => 'Пакуль няма Flipbook.';

  @override
  String get title => 'Назва Flipbook';
}
