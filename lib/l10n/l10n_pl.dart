import 'l10n.dart';

/// The translations for Polish (`pl`).
class L10nPl extends L10n {
  L10nPl([String locale = 'pl']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Chcesz usunąć ten flipbook?';

  @override
  String get loading => 'Ładowanie...';

  @override
  String get delete => 'Usuwać';

  @override
  String get cancel => 'Anulować';

  @override
  String get download => 'Pobierać';

  @override
  String get flipAnimation => 'Animacja Flip';

  @override
  String get preview => 'Zapowiedź';

  @override
  String get flipSpeed => 'Prędkość odwrócenia';

  @override
  String get successDownload => 'Pobierz sukces';

  @override
  String get error => 'Pobieranie błędów wideo';

  @override
  String get changeSpeed => 'Przesuń suwak, aby zmienić prędkość.';

  @override
  String get notitle => 'bez tytułu';

  @override
  String get search => 'Szukaj';

  @override
  String get noFlipbook => 'Na razie bez flipbook.';

  @override
  String get title => 'Tytuł Flipbooka';
}
