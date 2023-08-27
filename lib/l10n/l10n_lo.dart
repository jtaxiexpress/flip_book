import 'l10n.dart';

/// The translations for Lao (`lo`).
class L10nLo extends L10n {
  L10nLo([String locale = 'lo']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'ທ່ານຕ້ອງການລຶບ Flipbook ນີ້ບໍ?';

  @override
  String get loading => 'ກໍາລັງໂຫລດ ...';

  @override
  String get delete => 'ລົບ';

  @override
  String get cancel => 'ຍົກເລີກ';

  @override
  String get download => 'ດາວໂຫລດ';

  @override
  String get flipAnimation => 'ພິກມພາບເຄື່ອນໄຫວ';

  @override
  String get preview => 'ການສະແດງຕົວຢ່າງ';

  @override
  String get flipSpeed => 'ພິກຄວາມໄວ';

  @override
  String get successDownload => 'ດາວໂຫລດຄວາມສໍາເລັດ';

  @override
  String get error => 'ຂໍ້ຜິດພາດໃນການດາວໂຫລດວິດີໂອ';

  @override
  String get changeSpeed => 'ຍ້າຍແຖບເລື່ອນເພື່ອປ່ຽນຄວາມໄວ.';

  @override
  String get notitle => 'ບໍ່ມີຫົວຂໍ້';

  @override
  String get search => 'ຄົ້ນຫາ';

  @override
  String get noFlipbook => 'ບໍ່ມີ Flipbook ສໍາລັບດຽວນີ້.';

  @override
  String get title => 'ຫົວຂໍ້ຂອງ Flipbook';
}
