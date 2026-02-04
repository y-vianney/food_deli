class MenuItem {
  final String id;
  final String name;
  final double price;
  final double? originalPrice;
  final String image;
  final String? description;
  final int? calories;
  final String category;
  final bool isMostLiked;

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    this.originalPrice,
    required this.image,
    this.description,
    this.calories,
    required this.category,
    this.isMostLiked = false,
  });
}
