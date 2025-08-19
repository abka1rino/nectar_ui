import 'package:nectar_ui/core/constants/app_assets.dart';

class Product {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String categoryId;

  Product({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.categoryId,
  });
  static double gettotal(List<Product> products) {
    double totalPrice = 0.0;
    for (var product in products) {
      totalPrice += double.parse(product.price.replaceAll('\$', ''));
    }
    return totalPrice;
  }
}

List<Product> exclusiveProducts = [
  Product(
    image: AppAssets.applePng,
    title: 'Apple',
    subtitle: '1Kg',
    price: '\$1.00',
    categoryId: '4',
  ),
  Product(
    image: AppAssets.bananaPng,
    title: 'Banana',
    subtitle: '1Kg',
    price: '\$0.50',
    categoryId: '4',
  ),
  Product(
    image: AppAssets.gingerPng,
    title: 'Ginger',
    subtitle: '1Kg',
    price: '\$0.80',
    categoryId: '4',
  ),
  Product(
    image: AppAssets.bellPepperRedPng,
    title: 'Bell Pepper',
    subtitle: '1Kg',
    price: '\$1.20',
    categoryId: '4',
  ),
  Product(
    image: AppAssets.appleJuicePng,
    title: 'Apple Juice',
    subtitle: '500ml',
    price: '\$2.00',
    categoryId: '3',
  ),
  Product(
    image: AppAssets.cocaColaPng,
    title: 'Coca Cola',
    subtitle: '500ml',
    price: '\$1.50',
    categoryId: '3',
  ),
  Product(
    image: AppAssets.spritePng,
    title: 'Sprite',
    subtitle: '500ml',
    price: '\$1.50',
    categoryId: '3',
  ),
  Product(
    image: AppAssets.dietColaPng,
    title: 'Diet Cola',
    subtitle: '500ml',
    price: '\$1.50',
    categoryId: '3',
  ),
  Product(
    image: AppAssets.pepsiPng,
    title: 'Pepsi',
    subtitle: '500ml',
    price: '\$1.50',
    categoryId: '3',
  ),
];
List<Product> cartItems = [];
List<int> cartItemCount = [];
List<Product> favoriteItems = [];
