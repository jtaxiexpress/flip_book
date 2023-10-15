import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get flipbook => 'パラパラ漫画';

  @override
  String get deleteFlipbook => 'このプロジェクトを削除しますか？';

  @override
  String get loading => 'ロード中';

  @override
  String get delete => '削除';

  @override
  String get cancel => 'キャンセル';

  @override
  String get download => 'ダウンロード';

  @override
  String get flipAnimation => 'フリップアニメーション';

  @override
  String get preview => 'プレビュー';

  @override
  String get flipSpeed => 'フリップスピード';

  @override
  String get successDownload => 'ダウンロード成功';

  @override
  String get error => 'エラーが発生しました';

  @override
  String get changeSpeed => 'スライダーを動かしてスピードを変更する';

  @override
  String get notitle => 'タイトルなし';

  @override
  String get search => '検索';

  @override
  String get noFlipbook => 'パラパラ漫画がありません';

  @override
  String get title => 'タイトル';
}
