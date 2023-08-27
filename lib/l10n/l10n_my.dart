import 'l10n.dart';

/// The translations for Burmese (`my`).
class L10nMy extends L10n {
  L10nMy([String locale = 'my']) : super(locale);

  @override
  String get flipbook => 'အဘယ်အရာ';

  @override
  String get deleteFlipbook => 'ဒီ flipbook ကိုသင်ဖျက်ချင်ပါသလား။';

  @override
  String get loading => 'တင် ...';

  @override
  String get delete => 'ဖျက်';

  @override
  String get cancel => 'ပျက်စေ';

  @override
  String get download => 'ဒေါက်ဒေါင်း';

  @override
  String get flipAnimation => 'flip ကာတွန်း';

  @override
  String get preview => 'တင်ကူးသိမြင်';

  @override
  String get flipSpeed => 'မြန်နှုန်းမြန်နှုန်း';

  @override
  String get successDownload => 'အောင်မြင်မှုကိုဒေါင်းလုပ်ဆွဲပါ';

  @override
  String get error => 'ဗွီဒီယိုကိုဒေါင်းလုပ်လုပ်ခြင်းအမှား';

  @override
  String get changeSpeed => 'မြန်နှုန်းပြောင်းလဲရန် slider ကိုရွှေ့ပါ။';

  @override
  String get notitle => 'ခေါင်းစဉ်မရှိ';

  @override
  String get search => 'ရှာဖေွခြင်း';

  @override
  String get noFlipbook => 'ယခုအတွက် flipbook မရှိပါ။';

  @override
  String get title => 'Flipbook ၏ခေါင်းစဉ်';
}
