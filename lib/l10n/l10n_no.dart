import 'l10n.dart';

/// The translations for Norwegian (`no`).
class L10nNo extends L10n {
  L10nNo([String locale = 'no']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Vil du slette denne flipbooken?';

  @override
  String get loading => 'Laster ...';

  @override
  String get delete => 'Slett';

  @override
  String get cancel => 'Avbryt';

  @override
  String get download => 'nedlasting';

  @override
  String get flipAnimation => 'Flip -animasjon';

  @override
  String get preview => 'Forhåndsvisning';

  @override
  String get flipSpeed => 'Vend hastighet';

  @override
  String get successDownload => 'Last ned suksess';

  @override
  String get error => 'Feil nedlasting av video';

  @override
  String get changeSpeed => 'Flytt glidebryteren for å endre hastighet.';

  @override
  String get notitle => 'uten tittel';

  @override
  String get search => 'Søk';

  @override
  String get noFlipbook => 'Ingen flipbook for nå.';

  @override
  String get title => 'Flipbooks tittel';
}
