import 'package:get/get.dart';
import '../features/home/dashboard_page.dart';
import '../features/home/dashboard_binding.dart';
import '../features/product/product_detail_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.DASHBOARD;

  static final routes = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT_DETAIL,
      page: () => const ProductDetailScreen(),
    ),
  ];
}
