import 'l10n.dart';

/// The translations for Italian (`it`).
class L10nIt extends L10n {
  L10nIt([String locale = 'it']) : super(locale);

  @override
  String get flipbook => 'Libro pieghevole';

  @override
  String get deleteFlipbook => 'Vuoi eliminare questo flipbook?';

  @override
  String get loading => 'Caricamento...';

  @override
  String get delete => 'Eliminare';

  @override
  String get cancel => 'Annulla';

  @override
  String get download => 'Scaricamento';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'Anteprima';

  @override
  String get flipSpeed => 'Velocità di lancio';

  @override
  String get successDownload => 'Scarica il successo';

  @override
  String get error => 'Errore per il download di video';

  @override
  String get changeSpeed => 'Spostare il cursore per cambiare velocità.';

  @override
  String get notitle => 'senza titolo';

  @override
  String get search => 'Ricerca';

  @override
  String get noFlipbook => 'Nessun flipbook per ora.';

  @override
  String get title => 'Titolo di Flipbook';
}
