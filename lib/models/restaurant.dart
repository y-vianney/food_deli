class Restaurant {
  final String id;
  final String name;
  final String image;
  final double rating;
  final int reviews;
  final String priceRange;
  final String type;
  final String? distance;
  final String deliveryTime;
  final String deliveryFee;
  final String minOrder;
  final String? discount;
  final bool isFoodyPro;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.priceRange,
    required this.type,
    this.distance,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.minOrder,
    this.discount,
    this.isFoodyPro = false,
  });
}
