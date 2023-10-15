import 'l10n.dart';

/// The translations for Spanish Castilian (`es`).
class L10nEs extends L10n {
  L10nEs([String locale = 'es']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => '¿Quieres eliminar este flipbook?';

  @override
  String get loading => 'Cargando...';

  @override
  String get delete => 'Borrar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get download => 'Descargar';

  @override
  String get flipAnimation => 'Animación de flip';

  @override
  String get preview => 'Avance';

  @override
  String get flipSpeed => 'Velocidad de flip';

  @override
  String get successDownload => 'Descargar éxito';

  @override
  String get error => 'Error de descarga de video';

  @override
  String get changeSpeed => 'Mueva el control deslizante para cambiar la velocidad.';

  @override
  String get notitle => 'Sin título';

  @override
  String get search => 'Buscar';

  @override
  String get noFlipbook => 'No hay Flipbook por ahora.';

  @override
  String get title => 'Título del flipbook';
}
