import 'package:flutter/material.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';

class FavouriteProductCard extends StatelessWidget {
  const FavouriteProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          Image.asset(product.image, width: 70, height: 65),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                product.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                '${product.title}, Price',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7C7C7C),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
          Expanded(child: SizedBox()),
          Text(
            product.price,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 10),
          Transform.flip(
            flipX: true,
            child: Icon(Icons.arrow_back_ios, size: 20),
          ),
        ],
      ),
    );
  }
}
