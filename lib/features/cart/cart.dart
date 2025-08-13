import 'package:flutter/material.dart';
import 'package:nectar_ui/components/buttons/main_button.dart';
import 'package:nectar_ui/features/cart/widgets/myCart_product_card.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';

class CartScreen extends StatelessWidget {
  double totalPrice = 0.0;
  @override
  Widget build(BuildContext context) {
    for (var product in exclusiveProducts) {
      totalPrice += double.parse(product.price.replaceAll('\$', ''));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Color(0xFF181725),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(
            endIndent: 25,
            indent: 25,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: exclusiveProducts.length,
              itemBuilder: (context, index) {
                final product = exclusiveProducts[index];
                return MyCartProductCard(product: product);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  endIndent: 25,
                  indent: 25,
                  thickness: 1,
                  color: Color(0xFFE0E0E0),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MainButton(
              text: 'GO to Checkout              $totalPrice',
              onPressed: () {},
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
