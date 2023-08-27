import 'l10n.dart';

/// The translations for Korean (`ko`).
class L10nKo extends L10n {
  L10nKo([String locale = 'ko']) : super(locale);

  @override
  String get flipbook => '플립 북';

  @override
  String get deleteFlipbook => '이 플립 북을 삭제 하시겠습니까?';

  @override
  String get loading => '로딩 ...';

  @override
  String get delete => '삭제';

  @override
  String get cancel => '취소';

  @override
  String get download => '다운로드';

  @override
  String get flipAnimation => '플립 애니메이션';

  @override
  String get preview => '시사';

  @override
  String get flipSpeed => '플립 속도';

  @override
  String get successDownload => '성공을 다운로드하십시오';

  @override
  String get error => '비디오 다운로드 오류';

  @override
  String get changeSpeed => '슬라이더를 이동하여 속도를 변경하십시오.';

  @override
  String get notitle => '제목 없음';

  @override
  String get search => '찾다';

  @override
  String get noFlipbook => '지금은 플립 북이 없습니다.';

  @override
  String get title => 'Flipbook의 제목';
}
