import 'package:flutter/material.dart';
import 'package:nectar_ui/components/buttons/main_button.dart';
import 'package:nectar_ui/core/extentions/navigation.dart';
import 'package:nectar_ui/core/services/product_service.dart';
import 'package:nectar_ui/features/cart/widgets/bottom_sheet_section.dart';
import 'package:nectar_ui/features/checkout/checkout.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 15,
              top: 25,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Checkout',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          Divider(
            endIndent: 25,
            indent: 25,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              spacing: 10,
              children: [
                BottomSheetSection(
                  firstText: 'Delivery Address',
                  secondText: 'Select Method',
                ),
                Divider(
                  endIndent: 15,
                  indent: 15,
                  thickness: 1,
                  color: Color(0xFFE0E0E0),
                ),
                BottomSheetSection(
                  firstText: 'Payment Method',
                  secondText: 'Select Method',
                ),
                Divider(
                  endIndent: 15,
                  indent: 15,
                  thickness: 1,
                  color: Color(0xFFE0E0E0),
                ),
                BottomSheetSection(
                  firstText: 'Promo Code',
                  secondText: 'Enter Code',
                ),
                Divider(
                  endIndent: 15,
                  indent: 15,
                  thickness: 1,
                  color: Color(0xFFE0E0E0),
                ),
                BottomSheetSection(
                  firstText: 'Total Cost',
                  secondText:
                      '\$${ProductService.totalPrice(cartItems, cartItemCount).toString()}',
                ),
                SizedBox(height: 5),
                MainButton(
                  text: 'Checkout',
                  onPressed: () {
                    pushTo(context, CheckoutPage());
                  },
                ),
              ],
            ),
          ), // Add your checkout UI here
        ],
      ),
    );
  }
}
