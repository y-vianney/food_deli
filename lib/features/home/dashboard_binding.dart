import 'package:get/get.dart';
import 'dashboard_controller.dart';
import '../home/home_screen.dart';
import '../cart/cart_screen.dart';
import '../profile/profile_screen.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    // Lazy put controllers for tabs if they had any specific logic
  }
}
