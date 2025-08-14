import 'package:flutter/material.dart';
import 'package:nectar_ui/components/buttons/main_button.dart';
import 'package:nectar_ui/features/cart/widgets/myCart_product_card.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';
import 'package:nectar_ui/features/services/product_service.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void refreshCart() {
    setState(() {});
  }

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
      body: Column(
        children: [
          Divider(
            endIndent: 25,
            indent: 25,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
          cartItems.isEmpty
              ? Expanded(child: SizedBox(height: 10))
              : Expanded(
                  child: ListView.separated(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      final itemCount = cartItemCount[index];
                      return MyCartProductCard(
                        itemCount: itemCount,
                        product: product,
                        onRemove: () {
                          cartItems.remove(product);
                          cartItemCount.removeAt(index);
                          refreshCart();
                        },
                        onChange: refreshCart,
                      );
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
              text:
                  'GO to Checkout            \$${ProductService.totalPrice(cartItems, cartItemCount).toString()}',
              onPressed: () {},
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
