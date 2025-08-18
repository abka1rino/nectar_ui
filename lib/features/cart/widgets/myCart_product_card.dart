import 'package:flutter/material.dart';
import 'package:nectar_ui/core/utils/app_colors.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';
import 'package:nectar_ui/core/services/product_service.dart';

class MyCartProductCard extends StatelessWidget {
  const MyCartProductCard({
    super.key,
    required this.product,
    required this.onRemove,
    required this.itemCount,
    required this.onChange,
  });
  final Product product;
  final int itemCount;
  final VoidCallback onRemove;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(product.image, width: 70, height: 65),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                product.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7C7C7C),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ProductService.minusProduct(
                        product,
                        cartItems,
                        cartItemCount,
                      );
                      onChange();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE2E2E2)),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: itemCount == 1
                            ? AppColors.greyColor
                            : AppColors.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(itemCount.toString()),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      ProductService.addToCart(
                        product,
                        cartItems,
                        cartItemCount,
                      );
                      onChange();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE2E2E2)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                child: Icon(Icons.close, color: AppColors.greyColor, size: 24),
                onTap: onRemove,
              ),
              SizedBox(height: 40),
              Text(
                '\$${(double.parse(product.price.replaceAll('\$', '')) * itemCount).toString()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
