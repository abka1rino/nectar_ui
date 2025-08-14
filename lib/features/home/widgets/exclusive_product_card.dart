import 'package:flutter/material.dart';
import 'package:nectar_ui/core/services/product_service.dart';
import 'package:nectar_ui/core/utils/app_colors.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';

class ExclusiveCard extends StatelessWidget {
  const ExclusiveCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xFFE2E2E2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Center(child: Image.asset(product.image))),
            Text(
              product.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              product.subtitle,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7C7C7C),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.price,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    ProductService.addToCart(product, cartItems, cartItemCount);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.title} added to cart!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
