import 'l10n.dart';

/// The translations for Chinese (`zh`).
class L10nZh extends L10n {
  L10nZh([String locale = 'zh']) : super(locale);

  @override
  String get flipbook => '翻盖';

  @override
  String get deleteFlipbook => '您想删除这本翻译书吗？';

  @override
  String get loading => '加载...';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String get download => '下载';

  @override
  String get flipAnimation => '翻转动画';

  @override
  String get preview => '预览';

  @override
  String get flipSpeed => '翻转速度';

  @override
  String get successDownload => '下载成功';

  @override
  String get error => '错误下载视频';

  @override
  String get changeSpeed => '移动滑块以更改速度。';

  @override
  String get notitle => '无题';

  @override
  String get search => '搜索';

  @override
  String get noFlipbook => '目前还没有翻转书。';

  @override
  String get title => 'Flipbook的标题';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class L10nZhCn extends L10nZh {
  L10nZhCn(): super('zh_CN');

  @override
  String get flipbook => '翻盖';

  @override
  String get deleteFlipbook => '您想删除这本翻译书吗？';

  @override
  String get loading => '加载...';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String get download => '下载';

  @override
  String get flipAnimation => '翻转动画';

  @override
  String get preview => '预览';

  @override
  String get flipSpeed => '翻转速度';

  @override
  String get successDownload => '下载成功';

  @override
  String get error => '错误下载视频';

  @override
  String get changeSpeed => '移动滑块以更改速度。';

  @override
  String get notitle => '无题';

  @override
  String get search => '搜索';

  @override
  String get noFlipbook => '目前还没有翻转书。';

  @override
  String get title => 'Flipbook的标题';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class L10nZhTw extends L10nZh {
  L10nZhTw(): super('zh_TW');

  @override
  String get flipbook => '翻蓋';

  @override
  String get deleteFlipbook => '您想刪除這本翻譯書嗎？';

  @override
  String get loading => '加載...';

  @override
  String get delete => '刪除';

  @override
  String get cancel => '取消';

  @override
  String get download => '下載';

  @override
  String get flipAnimation => '翻轉動畫';

  @override
  String get preview => '預覽';

  @override
  String get flipSpeed => '翻轉速度';

  @override
  String get successDownload => '下載成功';

  @override
  String get error => '錯誤下載視頻';

  @override
  String get changeSpeed => '移動滑塊以更改速度。';

  @override
  String get notitle => '無題';

  @override
  String get search => '搜索';

  @override
  String get noFlipbook => '目前還沒有翻轉書。';

  @override
  String get title => 'Flipbook的標題';
}
