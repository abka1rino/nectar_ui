import 'package:flutter/material.dart';
import 'package:nectar_ui/core/constants/app_assets.dart';

class CategoryModel {
  final String image;
  final String title;
  final Color color;

  CategoryModel({
    required this.image,
    required this.title,
    required this.color,
  });
}

List<CategoryModel> categories = [
  CategoryModel(
    image: AppAssets.dairyPng,
    title: 'Dairy & Eggs',
    color: Color(0xFFFDE598),
  ),
  CategoryModel(
    image: AppAssets.bakeryPng,
    title: 'Bakery & Snacks',
    color: Color(0xFFD3B0E0),
  ),
  CategoryModel(
    image: AppAssets.beveragesPng,
    title: 'Beverages',
    color: Color(0xFFB7DFF5),
  ),
  CategoryModel(
    image: AppAssets.fruitsPng,
    title: 'Fresh Fruits & Vegetables',
    color: Color(0xFFB7DFF5),
  ),
  CategoryModel(
    image: AppAssets.oilPng,
    title: 'Cooking Oil & Ghee',
    color: Color(0xFFFDE598),
  ),
  CategoryModel(
    image: AppAssets.meatPng,
    title: 'Meat & Fish',
    color: Color(0xFFF7A593),
  ),
];
