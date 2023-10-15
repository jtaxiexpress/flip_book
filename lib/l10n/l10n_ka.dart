import 'l10n.dart';

/// The translations for Georgian (`ka`).
class L10nKa extends L10n {
  L10nKa([String locale = 'ka']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'გსურთ წაშალოთ ეს flipbook?';

  @override
  String get loading => 'Ჩატვირთვა...';

  @override
  String get delete => 'წაშლა';

  @override
  String get cancel => 'გაუქმება';

  @override
  String get download => 'ჩამოტვირთვა';

  @override
  String get flipAnimation => 'Flip ანიმაცია';

  @override
  String get preview => 'ანონსი';

  @override
  String get flipSpeed => 'ფლიპის სიჩქარე';

  @override
  String get successDownload => 'ჩამოტვირთეთ წარმატება';

  @override
  String get error => 'შეცდომის ჩამოტვირთვა ვიდეო';

  @override
  String get changeSpeed => 'გადაიტანეთ სლაიდერი სიჩქარის შესაცვლელად.';

  @override
  String get notitle => 'უსათაურო';

  @override
  String get search => 'ძებნა';

  @override
  String get noFlipbook => 'ახლა Flipbook არ არის.';

  @override
  String get title => 'Flipbook- ის სათაური';
}
