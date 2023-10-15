import 'l10n.dart';

/// The translations for Vietnamese (`vi`).
class L10nVi extends L10n {
  L10nVi([String locale = 'vi']) : super(locale);

  @override
  String get flipbook => 'Flipbook';

  @override
  String get deleteFlipbook => 'Bạn có muốn xóa cuốn sách này không?';

  @override
  String get loading => 'Đang tải...';

  @override
  String get delete => 'Xóa bỏ';

  @override
  String get cancel => 'Hủy bỏ';

  @override
  String get download => 'Tải xuống';

  @override
  String get flipAnimation => 'Lật hoạt hình';

  @override
  String get preview => 'Xem trước';

  @override
  String get flipSpeed => 'Tốc độ lật';

  @override
  String get successDownload => 'Tải xuống thành công';

  @override
  String get error => 'Lỗi khi tải xuống video';

  @override
  String get changeSpeed => 'Di chuyển thanh trượt để thay đổi tốc độ.';

  @override
  String get notitle => 'Không tiêu đề';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get noFlipbook => 'Không có flipbook bây giờ.';

  @override
  String get title => 'Tiêu đề của Flipbook';
}
