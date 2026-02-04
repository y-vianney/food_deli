import 'package:get/get.dart';
import '../features/cart/cart_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController(), permanent: true);
  }
}
