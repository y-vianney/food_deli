import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/category.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final category = categories[index];
          // Mapping icons to assets manually since dynamic asset path from icon name needs logic
          // React logic: categoryIcons map.
          String imagePath;
          switch (category.icon) {
            case 'garba': imagePath = 'assets/images/garba-hero.png'; break;
            case 'attieke': imagePath = 'assets/images/attieke-poisson.jpg'; break;
            case 'alloco': imagePath = 'assets/images/alloco.jpg'; break;
            case 'boissons': imagePath = 'assets/images/bissap.jpg'; break;
            case 'extras': imagePath = 'assets/images/alloco.jpg'; break;
            default: imagePath = 'assets/images/garba-hero.png';
          }

          return Column(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.text,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
