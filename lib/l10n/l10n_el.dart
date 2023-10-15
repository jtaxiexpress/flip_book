import 'l10n.dart';

/// The translations for Modern Greek (`el`).
class L10nEl extends L10n {
  L10nEl([String locale = 'el']) : super(locale);

  @override
  String get flipbook => 'Αναστολέα';

  @override
  String get deleteFlipbook => 'Θέλετε να διαγράψετε αυτό το flipbook;';

  @override
  String get loading => 'Φόρτωση...';

  @override
  String get delete => 'Διαγράφω';

  @override
  String get cancel => 'Ματαίωση';

  @override
  String get download => 'Κατεβάστε';

  @override
  String get flipAnimation => 'Animation flip';

  @override
  String get preview => 'Προεπισκόπηση';

  @override
  String get flipSpeed => 'Ταχύτατη ταχύτητα';

  @override
  String get successDownload => 'Κατεβάστε επιτυχία';

  @override
  String get error => 'Λήψη σφαλμάτων βίντεο';

  @override
  String get changeSpeed => 'Μετακινήστε το ρυθμιστικό για να αλλάξετε ταχύτητα.';

  @override
  String get notitle => 'χωρίς τίτλο';

  @override
  String get search => 'Αναζήτηση';

  @override
  String get noFlipbook => 'Δεν υπάρχει flipbook για τώρα.';

  @override
  String get title => 'Τίτλος του Flipbook';
}
