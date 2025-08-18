import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_ui/components/buttons/main_button.dart';
import 'package:nectar_ui/core/constants/app_assets.dart';
import 'package:nectar_ui/core/extentions/navigation.dart';
import 'package:nectar_ui/core/utils/app_colors.dart';
import 'package:nectar_ui/features/main/main_screen.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.completedSvg),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                'Your Order has been\naccepted',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF181725),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  'Your items has been placed and is on it’s way to being processed',
                  style: TextStyle(fontSize: 16, color: AppColors.greyColor),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16),
                child: MainButton(
                  text: 'Back to Home',
                  onPressed: () {
                    pushUntil(context, MainScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
