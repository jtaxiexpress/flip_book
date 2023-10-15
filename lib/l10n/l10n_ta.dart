import 'l10n.dart';

/// The translations for Tamil (`ta`).
class L10nTa extends L10n {
  L10nTa([String locale = 'ta']) : super(locale);

  @override
  String get flipbook => 'புத்தகத்தை திருப்பி வைக்கவும்';

  @override
  String get deleteFlipbook => 'இந்த ஃபிளிபுக்கை நீக்க விரும்புகிறீர்களா?';

  @override
  String get loading => 'ஏற்றுகிறது ...';

  @override
  String get delete => 'அழி';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get download => 'பதிவிறக்க Tamil';

  @override
  String get flipAnimation => 'அனிமேஷன் புரட்டுகிறது';

  @override
  String get preview => 'முன்னோட்ட';

  @override
  String get flipSpeed => 'புரட்ட வேகத்தை';

  @override
  String get successDownload => 'வெற்றியைப் பதிவிறக்கவும்';

  @override
  String get error => 'வீடியோவைப் பதிவிறக்குவதில் பிழை';

  @override
  String get changeSpeed => 'வேகத்தை மாற்ற ஸ்லைடரை நகர்த்தவும்.';

  @override
  String get notitle => 'தலைப்பு இல்லை';

  @override
  String get search => 'தேடல்';

  @override
  String get noFlipbook => 'இப்போது பிளிப் புக் இல்லை.';

  @override
  String get title => 'பிளிபுக்கின் தலைப்பு';
}
