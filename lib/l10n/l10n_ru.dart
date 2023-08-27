import 'l10n.dart';

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Вы хотите удалить этот Flipbook?';

  @override
  String get loading => 'Загрузка ...';

  @override
  String get delete => 'Удалить';

  @override
  String get cancel => 'Отмена';

  @override
  String get download => 'Скачать';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'Предварительный просмотр';

  @override
  String get flipSpeed => 'Переворачивать скорость';

  @override
  String get successDownload => 'Скачать успех';

  @override
  String get error => 'Ошибка загрузка видео';

  @override
  String get changeSpeed => 'Переместите ползунок, чтобы изменить скорость.';

  @override
  String get notitle => 'без заголовка';

  @override
  String get search => 'Поиск';

  @override
  String get noFlipbook => 'НЕТ Flipbook пока.';

  @override
  String get title => 'Название Flipbook';
}
