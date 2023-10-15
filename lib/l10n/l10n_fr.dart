import 'l10n.dart';

/// The translations for French (`fr`).
class L10nFr extends L10n {
  L10nFr([String locale = 'fr']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Voulez-vous supprimer ce flipbook?';

  @override
  String get loading => 'Chargement...';

  @override
  String get delete => 'Supprimer';

  @override
  String get cancel => 'Annuler';

  @override
  String get download => 'Télécharger';

  @override
  String get flipAnimation => 'Flip animation';

  @override
  String get preview => 'Aperçu';

  @override
  String get flipSpeed => 'Se retourner';

  @override
  String get successDownload => 'Télécharger le succès';

  @override
  String get error => 'Erreur de téléchargement vidéo';

  @override
  String get changeSpeed => 'Déplacez le curseur pour changer la vitesse.';

  @override
  String get notitle => 'pas de titre';

  @override
  String get search => 'Recherche';

  @override
  String get noFlipbook => 'Pas de flipbook pour l\'instant.';

  @override
  String get title => 'Titre de Flipbook';
}
