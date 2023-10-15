import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_af.dart';
import 'l10n_am.dart';
import 'l10n_ar.dart';
import 'l10n_az.dart';
import 'l10n_be.dart';
import 'l10n_bg.dart';
import 'l10n_bn.dart';
import 'l10n_bs.dart';
import 'l10n_ca.dart';
import 'l10n_cs.dart';
import 'l10n_da.dart';
import 'l10n_de.dart';
import 'l10n_el.dart';
import 'l10n_en.dart';
import 'l10n_es.dart';
import 'l10n_et.dart';
import 'l10n_eu.dart';
import 'l10n_fa.dart';
import 'l10n_fi.dart';
import 'l10n_fr.dart';
import 'l10n_gl.dart';
import 'l10n_gu.dart';
import 'l10n_he.dart';
import 'l10n_hi.dart';
import 'l10n_hr.dart';
import 'l10n_hu.dart';
import 'l10n_hy.dart';
import 'l10n_id.dart';
import 'l10n_is.dart';
import 'l10n_it.dart';
import 'l10n_ja.dart';
import 'l10n_ka.dart';
import 'l10n_kk.dart';
import 'l10n_km.dart';
import 'l10n_kn.dart';
import 'l10n_ko.dart';
import 'l10n_ky.dart';
import 'l10n_lo.dart';
import 'l10n_lt.dart';
import 'l10n_lv.dart';
import 'l10n_mk.dart';
import 'l10n_ml.dart';
import 'l10n_mn.dart';
import 'l10n_mr.dart';
import 'l10n_ms.dart';
import 'l10n_my.dart';
import 'l10n_ne.dart';
import 'l10n_nl.dart';
import 'l10n_no.dart';
import 'l10n_or.dart';
import 'l10n_pa.dart';
import 'l10n_pl.dart';
import 'l10n_ps.dart';
import 'l10n_pt.dart';
import 'l10n_ro.dart';
import 'l10n_ru.dart';
import 'l10n_si.dart';
import 'l10n_sk.dart';
import 'l10n_sl.dart';
import 'l10n_sq.dart';
import 'l10n_sr.dart';
import 'l10n_sv.dart';
import 'l10n_sw.dart';
import 'l10n_ta.dart';
import 'l10n_te.dart';
import 'l10n_th.dart';
import 'l10n_tl.dart';
import 'l10n_tr.dart';
import 'l10n_uk.dart';
import 'l10n_ur.dart';
import 'l10n_uz.dart';
import 'l10n_vi.dart';
import 'l10n_zh.dart';

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('af'),
    Locale('am'),
    Locale('ar'),
    Locale('az'),
    Locale('be'),
    Locale('bg'),
    Locale('bn'),
    Locale('bs'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('gl'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('hy'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('km'),
    Locale('kn'),
    Locale('ko'),
    Locale('ky'),
    Locale('lo'),
    Locale('lt'),
    Locale('lv'),
    Locale('mk'),
    Locale('ml'),
    Locale('mn'),
    Locale('mr'),
    Locale('ms'),
    Locale('my'),
    Locale('ne'),
    Locale('nl'),
    Locale('no'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('ps'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sr'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vi'),
    Locale('zh', 'CN'),
    Locale('zh', 'TW'),
    Locale('zh')
  ];

  /// No description provided for @flipbook.
  ///
  /// In en, this message translates to:
  /// **'Flipbook'**
  String get flipbook;

  /// No description provided for @deleteFlipbook.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete this Flipbook?'**
  String get deleteFlipbook;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @flipAnimation.
  ///
  /// In en, this message translates to:
  /// **'Flip Animation'**
  String get flipAnimation;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// No description provided for @flipSpeed.
  ///
  /// In en, this message translates to:
  /// **'Flip Speed'**
  String get flipSpeed;

  /// No description provided for @successDownload.
  ///
  /// In en, this message translates to:
  /// **'Download Success'**
  String get successDownload;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error downloading video'**
  String get error;

  /// No description provided for @changeSpeed.
  ///
  /// In en, this message translates to:
  /// **'Move the slider to change speed.'**
  String get changeSpeed;

  /// No description provided for @notitle.
  ///
  /// In en, this message translates to:
  /// **'no title'**
  String get notitle;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @noFlipbook.
  ///
  /// In en, this message translates to:
  /// **'No Flipbook for now.'**
  String get noFlipbook;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Flipbook\'s Title'**
  String get title;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['af', 'am', 'ar', 'az', 'be', 'bg', 'bn', 'bs', 'ca', 'cs', 'da', 'de', 'el', 'en', 'es', 'et', 'eu', 'fa', 'fi', 'fr', 'gl', 'gu', 'he', 'hi', 'hr', 'hu', 'hy', 'id', 'is', 'it', 'ja', 'ka', 'kk', 'km', 'kn', 'ko', 'ky', 'lo', 'lt', 'lv', 'mk', 'ml', 'mn', 'mr', 'ms', 'my', 'ne', 'nl', 'no', 'or', 'pa', 'pl', 'ps', 'pt', 'ro', 'ru', 'si', 'sk', 'sl', 'sq', 'sr', 'sv', 'sw', 'ta', 'te', 'th', 'tl', 'tr', 'uk', 'ur', 'uz', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh': {
  switch (locale.countryCode) {
    case 'CN': return L10nZhCn();
case 'TW': return L10nZhTw();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af': return L10nAf();
    case 'am': return L10nAm();
    case 'ar': return L10nAr();
    case 'az': return L10nAz();
    case 'be': return L10nBe();
    case 'bg': return L10nBg();
    case 'bn': return L10nBn();
    case 'bs': return L10nBs();
    case 'ca': return L10nCa();
    case 'cs': return L10nCs();
    case 'da': return L10nDa();
    case 'de': return L10nDe();
    case 'el': return L10nEl();
    case 'en': return L10nEn();
    case 'es': return L10nEs();
    case 'et': return L10nEt();
    case 'eu': return L10nEu();
    case 'fa': return L10nFa();
    case 'fi': return L10nFi();
    case 'fr': return L10nFr();
    case 'gl': return L10nGl();
    case 'gu': return L10nGu();
    case 'he': return L10nHe();
    case 'hi': return L10nHi();
    case 'hr': return L10nHr();
    case 'hu': return L10nHu();
    case 'hy': return L10nHy();
    case 'id': return L10nId();
    case 'is': return L10nIs();
    case 'it': return L10nIt();
    case 'ja': return L10nJa();
    case 'ka': return L10nKa();
    case 'kk': return L10nKk();
    case 'km': return L10nKm();
    case 'kn': return L10nKn();
    case 'ko': return L10nKo();
    case 'ky': return L10nKy();
    case 'lo': return L10nLo();
    case 'lt': return L10nLt();
    case 'lv': return L10nLv();
    case 'mk': return L10nMk();
    case 'ml': return L10nMl();
    case 'mn': return L10nMn();
    case 'mr': return L10nMr();
    case 'ms': return L10nMs();
    case 'my': return L10nMy();
    case 'ne': return L10nNe();
    case 'nl': return L10nNl();
    case 'no': return L10nNo();
    case 'or': return L10nOr();
    case 'pa': return L10nPa();
    case 'pl': return L10nPl();
    case 'ps': return L10nPs();
    case 'pt': return L10nPt();
    case 'ro': return L10nRo();
    case 'ru': return L10nRu();
    case 'si': return L10nSi();
    case 'sk': return L10nSk();
    case 'sl': return L10nSl();
    case 'sq': return L10nSq();
    case 'sr': return L10nSr();
    case 'sv': return L10nSv();
    case 'sw': return L10nSw();
    case 'ta': return L10nTa();
    case 'te': return L10nTe();
    case 'th': return L10nTh();
    case 'tl': return L10nTl();
    case 'tr': return L10nTr();
    case 'uk': return L10nUk();
    case 'ur': return L10nUr();
    case 'uz': return L10nUz();
    case 'vi': return L10nVi();
    case 'zh': return L10nZh();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
