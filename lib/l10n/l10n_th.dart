import 'l10n.dart';

/// The translations for Thai (`th`).
class L10nTh extends L10n {
  L10nTh([String locale = 'th']) : super(locale);

  @override
  String get flipbook => 'สมุดรายชื่อ';

  @override
  String get deleteFlipbook => 'คุณต้องการลบ flipbook นี้หรือไม่?';

  @override
  String get loading => 'กำลังโหลด ...';

  @override
  String get delete => 'ลบ';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get download => 'การดาวน์โหลด';

  @override
  String get flipAnimation => 'อนิเมชั่นพลิก';

  @override
  String get preview => 'ดูตัวอย่าง';

  @override
  String get flipSpeed => 'ความเร็วพลิก';

  @override
  String get successDownload => 'ดาวน์โหลดความสำเร็จ';

  @override
  String get error => 'ข้อผิดพลาดในการดาวน์โหลดวิดีโอ';

  @override
  String get changeSpeed => 'เลื่อนแถบเลื่อนเพื่อเปลี่ยนความเร็ว';

  @override
  String get notitle => 'ไม่มีชื่อเรื่อง';

  @override
  String get search => 'ค้นหา';

  @override
  String get noFlipbook => 'ไม่มี flipbook ในตอนนี้';

  @override
  String get title => 'ชื่อของ Flipbook';
}
