import 'l10n.dart';

/// The translations for Ukrainian (`uk`).
class L10nUk extends L10n {
  L10nUk([String locale = 'uk']) : super(locale);

  @override
  String get flipbook => 'Фліп -книжник';

  @override
  String get deleteFlipbook => 'Ви хочете видалити цю фліп -книжку?';

  @override
  String get loading => 'Завантаження ...';

  @override
  String get delete => 'Видаляти';

  @override
  String get cancel => 'Скасувати';

  @override
  String get download => 'Завантажувати';

  @override
  String get flipAnimation => 'Фліп -анімація';

  @override
  String get preview => 'Попередній перегляд';

  @override
  String get flipSpeed => 'Швидкість фліп';

  @override
  String get successDownload => 'Завантажити успіх';

  @override
  String get error => 'Помилка завантаження відео';

  @override
  String get changeSpeed => 'Перемістіть повзунок, щоб змінити швидкість.';

  @override
  String get notitle => 'Ніяка назва';

  @override
  String get search => 'Обшук';

  @override
  String get noFlipbook => 'Наразі немає фліпбуру.';

  @override
  String get title => 'Назва Flipbook';
}
