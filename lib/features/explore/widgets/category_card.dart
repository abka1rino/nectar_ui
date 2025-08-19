import 'package:flutter/material.dart';
import 'package:nectar_ui/category%20screeen/category_screen.dart';
import 'package:nectar_ui/core/extentions/navigation.dart';
import 'package:nectar_ui/features/explore/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, CategoryScreen(category: category));
      },
      child: Container(
        width: 173,
        height: 200,
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Center(child: Image.asset(category.image))),
              Text(
                category.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
