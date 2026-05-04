class StoreModel {
  final String title;
  final String subTitle;
  final String imageUrl;
  final String? tag;
  final String? badge;
  final double? rating;

  StoreModel({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    this.tag,
    this.badge,
    this.rating,
  });
}