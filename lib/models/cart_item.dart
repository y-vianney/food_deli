import 'menu_item.dart';

class CartItem {
  final MenuItem menuItem; // Composition instead of inheritance used in Typescript
  final int quantity;
  final List<String> addons;

  CartItem({
    required this.menuItem,
    required this.quantity,
    this.addons = const [],
  });

  double get totalPrice => menuItem.price * quantity;
  
  CartItem copyWith({
    MenuItem? menuItem,
    int? quantity,
    List<String>? addons,
  }) {
    return CartItem(
      menuItem: menuItem ?? this.menuItem,
      quantity: quantity ?? this.quantity,
      addons: addons ?? this.addons,
    );
  }
}
