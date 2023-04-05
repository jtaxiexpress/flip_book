class FlipBook {
  String title;
  String creationDate;
  List<String> imageUrls;
  double flipSpeed;
  bool hasFlipAnimation;

  FlipBook({
    required this.title,
    required this.creationDate,
    required this.imageUrls,
    this.flipSpeed = 25,
    this.hasFlipAnimation = true,
  });

  factory FlipBook.fromJson(Map<String, dynamic> json) {
    return FlipBook(
      title: json['title'],
      creationDate: json['creationDate'],
      imageUrls: List<String>.from(json['imageUrls']),
      flipSpeed: json['flipSpeed'].toDouble(),
      hasFlipAnimation: json['hasFlipAnimation'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['creationDate'] = creationDate;
    data['imageUrls'] = imageUrls;
    data['flipSpeed'] = flipSpeed;
    data['hasFlipAnimation'] = hasFlipAnimation;
    return data;
  }
}
