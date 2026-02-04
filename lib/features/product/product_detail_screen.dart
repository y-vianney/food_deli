import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/theme/app_theme.dart';
import '../../data/mock_data.dart';
import '../cart/cart_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  List<String> selectedAddons = [];

  // Get the controller
  final CartController cartController = Get.find<CartController>();

  void toggleAddon(String addonName) {
    setState(() {
      if (selectedAddons.contains(addonName)) {
        selectedAddons.remove(addonName);
      } else {
        if (selectedAddons.length < 3) {
          selectedAddons.add(addonName);
        }
      }
    });
  }

  double calculateTotal(double basePrice) {
    double addonsTotal = 0;
    for (var name in selectedAddons) {
      final addon = MockData.addons.firstWhere((a) => a['name'] == name);
      addonsTotal += (addon['price'] as int);
    }
    return (basePrice + addonsTotal) * quantity;
  }

  @override
  Widget build(BuildContext context) {
    final menuItemId = Get.parameters['id'];

    // Find item
    final item = MockData.menuItems.firstWhere(
      (m) => m.id == menuItemId,
      orElse: () => MockData.menuItems[0], // Fallback
    );

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 320,
            child: Image.asset(item.image, fit: BoxFit.cover),
          ),

          // Header Buttons
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircleButton(
                  icon: LucideIcons.chevronLeft,
                  onTap: () => Get.back(),
                ),
                Row(
                  children: [
                    _buildCircleButton(icon: LucideIcons.heart, onTap: () {}),
                    const SizedBox(width: 8),
                    _buildCircleButton(
                      icon: LucideIcons.helpCircle,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Content
          Positioned.fill(
            top: 280,
            child: Container(
              decoration: const BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        top: 24,
                        left: 16,
                        right: 16,
                        bottom: 100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (item.isMostLiked == true) ...[
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.secondary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Populaire',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],

                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (item.calories != null)
                                Text(
                                  '${item.calories} Cal.',
                                  style: const TextStyle(color: AppTheme.muted),
                                ),
                              const SizedBox(width: 12),
                              Text(
                                '${item.price.toInt()} FCFA',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primary,
                                ),
                              ),
                              if (item.originalPrice != null) ...[
                                const SizedBox(width: 8),
                                Text(
                                  '${item.originalPrice!.toInt()} F',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.muted,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ],
                          ),

                          const SizedBox(height: 16),
                          Text(
                            item.description ?? '',
                            style: const TextStyle(
                              color: AppTheme.muted,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Addons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Suppléments',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Sélectionnez jusqu\'à 3',
                                    style: TextStyle(
                                      color: AppTheme.muted,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppTheme.muted.withOpacity(0.3),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'Optionnel',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),
                          ...MockData.addons.map((addon) {
                            final isSelected = selectedAddons.contains(
                              addon['name'],
                            );
                            final price = addon['price'] as int;
                            return InkWell(
                              onTap: () => toggleAddon(addon['name']),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppTheme.primary
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: isSelected
                                              ? AppTheme.primary
                                              : AppTheme.muted,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: isSelected
                                          ? const Icon(
                                              Icons.check,
                                              size: 16,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      addon['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '+ ${price} F',
                                      style: const TextStyle(
                                        color: AppTheme.muted,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),

                          const SizedBox(height: 24),
                          const Text(
                            'Instructions spéciales',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Ex: Sans piment, plus de tomates...',
                              filled: true,
                              fillColor: AppTheme.secondary,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFF3F4F6))),
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.secondary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => setState(
                              () => quantity = quantity > 1 ? quantity - 1 : 1,
                            ),
                            icon: const Icon(LucideIcons.minus, size: 16),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          SizedBox(
                            width: 24,
                            child: Center(
                              child: Text(
                                '$quantity',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => setState(() => quantity++),
                            icon: const Icon(LucideIcons.plus, size: 16),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          cartController.addItem(
                            item,
                            quantity: quantity,
                            addons: selectedAddons,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${item.name} ajouté au panier'),
                            ),
                          );
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Ajouter - ${calculateTotal(item.price).toInt()} F',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
