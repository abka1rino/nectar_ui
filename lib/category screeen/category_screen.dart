import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:nectar_ui/core/constants/app_assets.dart';
import 'package:nectar_ui/features/explore/models/category_model.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';
import 'package:nectar_ui/features/home/widgets/exclusive_product_card.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.category});
  final CategoryModel category;
  late List<Product> filteredProducts = [];
  @override
  Widget build(BuildContext context) {
    if (filteredProducts.isEmpty) {
      for (var product in exclusiveProducts) {
        if (product.categoryId == category.id) {
          filteredProducts.add(product);
        }
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          category.title,
          style: TextStyle(
            color: Color(0xFF181725),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppAssets.mixerSvg),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              filteredProducts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 150),
                          Lottie.asset(AppAssets.noItems),
                        ],
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: .80,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ExclusiveCard(product: filteredProducts[index]);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
