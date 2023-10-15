import 'l10n.dart';

/// The translations for Armenian (`hy`).
class L10nHy extends L10n {
  L10nHy([String locale = 'hy']) : super(locale);

  @override
  String get flipbook => 'Շոշափել';

  @override
  String get deleteFlipbook => 'Do անկանում եք ջնջել այս Flipbook- ը:';

  @override
  String get loading => 'Բեռնում ...';

  @override
  String get delete => 'Ջնջել';

  @override
  String get cancel => 'Չեղարկել';

  @override
  String get download => 'Ներբեռնեք';

  @override
  String get flipAnimation => 'Մնաց անիմացիա';

  @override
  String get preview => 'Նախադիտում';

  @override
  String get flipSpeed => 'Մատով խփել արագություն';

  @override
  String get successDownload => 'Ներբեռնեք հաջողություն';

  @override
  String get error => 'Տեսանյութ ներբեռնելու սխալ';

  @override
  String get changeSpeed => 'Տեղափոխեք սահնակը `արագությունը փոխելու համար:';

  @override
  String get notitle => 'ոչ մի վերնագիր';

  @override
  String get search => 'Որոնել';

  @override
  String get noFlipbook => 'Առայժմ FlipBook:';

  @override
  String get title => 'Flipbook- ի վերնագիրը';
}
