import 'package:get/get.dart';
import '../../models/cart_item.dart';
import '../../models/menu_item.dart';

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  void addItem(
    MenuItem item, {
    int quantity = 1,
    List<String> addons = const [],
  }) {
    final existingIndex = cartItems.indexWhere((i) => i.menuItem.id == item.id);

    if (existingIndex >= 0) {
      final existingItem = cartItems[existingIndex];
      cartItems[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
      );
    } else {
      cartItems.add(
        CartItem(menuItem: item, quantity: quantity, addons: addons),
      );
    }
  }

  void removeItem(String itemId) {
    cartItems.removeWhere((item) => item.menuItem.id == itemId);
  }

  void updateQuantity(String itemId, int quantity) {
    if (quantity <= 0) {
      removeItem(itemId);
      return;
    }

    final index = cartItems.indexWhere((item) => item.menuItem.id == itemId);
    if (index >= 0) {
      cartItems[index] = cartItems[index].copyWith(quantity: quantity);
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.totalPrice);
}
