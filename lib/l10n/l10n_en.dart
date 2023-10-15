import 'l10n.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Do you want to delete this Flipbook?';

  @override
  String get loading => 'Loading...';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get download => 'Download';

  @override
  String get flipAnimation => 'Flip Animation';

  @override
  String get preview => 'Preview';

  @override
  String get flipSpeed => 'Flip Speed';

  @override
  String get successDownload => 'Download Success';

  @override
  String get error => 'Error downloading video';

  @override
  String get changeSpeed => 'Move the slider to change speed.';

  @override
  String get notitle => 'no title';

  @override
  String get search => 'Search';

  @override
  String get noFlipbook => 'No Flipbook for now.';

  @override
  String get title => 'Flipbook\'s Title';
}
