import '../models/category.dart';
import '../models/menu_item.dart';
import '../models/restaurant.dart';

class MockData {
  static final List<Category> categories = [
    Category(id: "1", name: "Garba", icon: "garba"),
    Category(id: "2", name: "Attiéké", icon: "attieke"),
    Category(id: "3", name: "Alloco", icon: "alloco"),
    Category(id: "4", name: "Boissons", icon: "boissons"),
    Category(id: "5", name: "Extras", icon: "extras"),
  ];

  static final Restaurant restaurant = Restaurant(
    id: "1",
    name: "Chez Tantie Garba",
    image: "assets/images/garba-banner.jpg",
    rating: 4.9,
    reviews: 2341,
    priceRange: "\$",
    type: "Cuisine Ivoirienne",
    distance: "0.5 km",
    deliveryTime: "15-25 min",
    deliveryFee: "500 FCFA",
    minOrder: "1500 FCFA",
    discount: "10%",
    isFoodyPro: true,
  );

  static final List<MenuItem> menuItems = [
    MenuItem(
      id: "1",
      name: "Garba Simple",
      price: 1000,
      image: "assets/images/garba-simple.jpg",
      description: "Le classique ! Attiéké frais accompagné de thon frit croustillant, servi avec tomates, oignons et piment.",
      calories: 450,
      category: "Garba",
      isMostLiked: true,
    ),
    MenuItem(
      id: "2",
      name: "Garba Royal",
      price: 2000,
      originalPrice: 2500,
      image: "assets/images/garba-royal.jpg",
      description: "Notre spécialité ! Double portion de thon frit, attiéké généreux, crudités fraîches et sauce spéciale maison.",
      calories: 680,
      category: "Garba",
      isMostLiked: true,
    ),
    MenuItem(
      id: "3",
      name: "Garba Complet",
      price: 1500,
      image: "assets/images/garba-hero.png",
      description: "Garba traditionnel avec portion généreuse de thon, attiéké, tomates, oignons, piment et cube Maggi.",
      calories: 520,
      category: "Popular",
      isMostLiked: true,
    ),
    MenuItem(
      id: "4",
      name: "Attiéké Poisson Braisé",
      price: 2500,
      image: "assets/images/attieke-poisson.jpg",
      description: "Attiéké servi avec un poisson entier braisé aux épices africaines et sa garniture de légumes.",
      calories: 600,
      category: "Attiéké",
    ),
    MenuItem(
      id: "5",
      name: "Alloco",
      price: 800,
      image: "assets/images/alloco.jpg",
      description: "Bananes plantains mûres frites, dorées et croustillantes. Parfait en accompagnement ou en snack.",
      calories: 320,
      category: "Alloco",
    ),
    MenuItem(
      id: "6",
      name: "Alloco + Oeuf",
      price: 1200,
      image: "assets/images/alloco.jpg",
      description: "Alloco servi avec des oeufs frits et sauce pimentée.",
      calories: 450,
      category: "Alloco",
    ),
    MenuItem(
      id: "7",
      name: "Bissap",
      price: 500,
      image: "assets/images/bissap.jpg",
      description: "Jus de fleur d'hibiscus frais et sucré. Boisson traditionnelle rafraîchissante.",
      calories: 120,
      category: "Boissons",
    ),
    MenuItem(
      id: "8",
      name: "Gingembre",
      price: 500,
      image: "assets/images/bissap.jpg",
      description: "Jus de gingembre frais, épicé et revigorant. Boost d'énergie naturel.",
      calories: 80,
      category: "Boissons",
    ),
  ];

  static final List<Map<String, dynamic>> addons = [
    { "name": "Thon Supplémentaire", "price": 500 },
    { "name": "Oeuf Frit", "price": 200 },
    { "name": "Piment Extra", "price": 100 },
    { "name": "Cube Maggi", "price": 50 },
    { "name": "Avocat", "price": 300 },
    { "name": "Alloco (portion)", "price": 400 },
  ];
}
