import 'package:flutter/material.dart';
import 'package:nectar_ui/components/buttons/main_button.dart';
import 'package:nectar_ui/components/inputs/custom_text_form_field.dart';
import 'package:nectar_ui/core/extentions/navigation.dart';
import 'package:nectar_ui/core/utils/app_colors.dart';
import 'package:nectar_ui/features/auth/page/login_screen.dart';
import 'package:nectar_ui/features/auth/widgets/auth_header.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeader(title: 'Signup', heading: 'Enter your info'),
                    SizedBox(height: 40),
                    CustomTextFormField(
                      labelText: 'Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Password',
                      onChanged: (value) {},
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: AppColors.primaryColor,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    MainButton(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Handle signup logic here
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'By continuing you agree to our ',
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {},
                              child: Text(
                                'Privacy Policy ',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                          TextSpan(
                            text: 'By continuing you agree to our ',
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account!',
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                        TextButton(
                          onPressed: () {
                            pushWithReplacement(context, LoginScreen());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
