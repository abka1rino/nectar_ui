import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_ui/components/buttons/main_button.dart';
import 'package:nectar_ui/core/constants/app_assets.dart';
import 'package:nectar_ui/core/extentions/navigation.dart';
import 'package:nectar_ui/features/auth/page/location_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.welcomePng,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 60,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SvgPicture.asset(
                  AppAssets.carrotSvg,
                  width: 50,
                  height: 50,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                SizedBox(height: 20),
                const Text(
                  'Welcome \nto our store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Get your groceries in as fast as one hour',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: MainButton(
                    text: 'Get Started',
                    onPressed: () {
                      pushWithReplacement(context, LocationPage());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
