import 'l10n.dart';

/// The translations for Portuguese (`pt`).
class L10nPt extends L10n {
  L10nPt([String locale = 'pt']) : super(locale);

  @override
  String get flipbook => 'FlipBook';

  @override
  String get deleteFlipbook => 'Você quer excluir este flipbook?';

  @override
  String get loading => 'Carregando...';

  @override
  String get delete => 'Excluir';

  @override
  String get cancel => 'Cancelar';

  @override
  String get download => 'Download';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'Visualização';

  @override
  String get flipSpeed => 'Velocidade de flip';

  @override
  String get successDownload => 'Baixar sucesso';

  @override
  String get error => 'Erro ao baixar vídeo';

  @override
  String get changeSpeed => 'Mova o controle deslizante para mudar de velocidade.';

  @override
  String get notitle => 'Sem título';

  @override
  String get search => 'Procurar';

  @override
  String get noFlipbook => 'Sem flipbook por enquanto.';

  @override
  String get title => 'Título do FlipBook';
}
