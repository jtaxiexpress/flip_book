class FlipBook {
  String id;
  String title;
  String creationDate;
  String? imagesDirPath;
  List<String> imageUrls;
  bool hasFlipAnimation;

  FlipBook({
    required this.id,
    required this.title,
    required this.creationDate,
    required this.imageUrls,
    this.imagesDirPath,
    this.hasFlipAnimation = true,
  });

  factory FlipBook.fromJson(Map<String, dynamic> json) {
    return FlipBook(
      title: json['title'],
      creationDate: json['creationDate'],
      imagesDirPath: json['imagesDirPath'],
      imageUrls: _parseList(json['imageUrls']),
      hasFlipAnimation: json['hasFlipAnimation'] == 0 ? false : true,
      id: json['id'],
    );
  }

  static List<String> _parseList(String listStr) {
    return listStr.split(',');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['id'] = id;
    data['creationDate'] = creationDate;
    data['imageUrls'] = imageUrls.join(',');
    data['imagesDirPath'] = imagesDirPath;
    data['hasFlipAnimation'] = hasFlipAnimation ? 1 : 0;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
