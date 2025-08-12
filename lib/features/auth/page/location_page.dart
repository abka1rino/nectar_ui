import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_ui/components/buttons/main_button.dart';
import 'package:nectar_ui/components/inputs/custom_text_form_field.dart';
import 'package:nectar_ui/core/constants/app_assets.dart';
import 'package:nectar_ui/core/extentions/navigation.dart';
import 'package:nectar_ui/core/utils/app_colors.dart';
import 'package:nectar_ui/features/auth/page/login_screen.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Center(
                  child: SizedBox(
                    width: 230,
                    height: 130,
                    child: SvgPicture.asset(AppAssets.locationSvg),
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  'Select Your Location',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),
                Text(
                  'Swithch on your location to stay in tune with what’s happening in your area',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 120),
                CustomTextFormField(
                  labelText: 'Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 80),
                MainButton(
                  text: 'Sumbit',
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      // Handle form submission
                      pushWithReplacement(context, LoginScreen());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
