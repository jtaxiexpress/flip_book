import 'l10n.dart';

/// The translations for Galician (`gl`).
class L10nGl extends L10n {
  L10nGl([String locale = 'gl']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => '¿Queres eliminar este flipbook?';

  @override
  String get loading => 'Cargando ...';

  @override
  String get delete => 'Eliminar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get download => 'Descargar';

  @override
  String get flipAnimation => 'Animación flip';

  @override
  String get preview => 'Vista previa';

  @override
  String get flipSpeed => 'Velocidade';

  @override
  String get successDownload => 'Descargar éxito';

  @override
  String get error => 'Erro ao descargar vídeo';

  @override
  String get changeSpeed => 'Mover o control deslizante para cambiar a velocidade.';

  @override
  String get notitle => 'Sen título';

  @override
  String get search => 'Busca';

  @override
  String get noFlipbook => 'Non hai Flipbook por agora.';

  @override
  String get title => 'Título de Flipbook';
}
