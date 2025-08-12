import 'package:flutter/material.dart';
import 'package:nectar_ui/features/cart/widgets/myCart_product_card.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              endIndent: 25,
              indent: 25,
              thickness: 1,
              color: Color(0xFFE0E0E0),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
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
          ],
        ),
      ),
    );
  }
}
