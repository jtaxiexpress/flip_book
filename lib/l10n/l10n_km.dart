import 'l10n.dart';

/// The translations for Khmer Central Khmer (`km`).
class L10nKm extends L10n {
  L10nKm([String locale = 'km']) : super(locale);

  @override
  String get flipbook => 'បកសឺវីស';

  @override
  String get deleteFlipbook => 'តើអ្នកចង់លុបសៀវភៅត្រឡប់នេះទេ?';

  @override
  String get loading => 'កំពុងផ្ទុក ...';

  @override
  String get delete => 'របៅបេលរសច';

  @override
  String get cancel => 'លប់ចោល';

  @override
  String get download => 'របចាបរេកា';

  @override
  String get flipAnimation => 'ត្រឡប់ចលនា';

  @override
  String get preview => 'បុរេតសសន៍';

  @override
  String get flipSpeed => 'ល្បឿនត្រឡប់';

  @override
  String get successDownload => 'ទាញយកភាពជោគជ័យ';

  @override
  String get error => 'កំហុសក្នុងការទាញយកវីដេអូ';

  @override
  String get changeSpeed => 'ផ្លាស់ទីគ្រាប់រំកិលដើម្បីផ្លាស់ប្តូរល្បឿន។';

  @override
  String get notitle => 'គ្មានចំណងជើង';

  @override
  String get search => 'ការឆេកឆេ';

  @override
  String get noFlipbook => 'មិនមានព្រុយទេសម្រាប់ពេលនេះ។';

  @override
  String get title => 'ចំណងជើងរបស់ Flipbook';
}
