import 'package:flutter/material.dart';
import 'package:nectar_ui/components/buttons/main_button.dart';
import 'package:nectar_ui/features/favourite/widgets/favourite_product_card.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
          Divider(thickness: 1, color: Color(0xFFE0E0E0)),
          Expanded(
            child: ListView.separated(
              itemCount: exclusiveProducts.length,
              itemBuilder: (context, index) {
                return FavouriteProductCard(product: exclusiveProducts[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 1, color: Color(0xFFE0E0E0));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MainButton(text: 'Add All To Cart', onPressed: () {}),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
