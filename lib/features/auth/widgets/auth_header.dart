import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_ui/core/constants/app_assets.dart';
import 'package:nectar_ui/core/utils/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.heading});
  final String title, heading;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset(AppAssets.carrotSvg)],
        ),
        SizedBox(height: 40),
        Text(
          title,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
        ),
        SizedBox(height: 10),
        Text(
          heading,
          style: TextStyle(fontSize: 16, color: AppColors.greyColor),
        ),
      ],
    );
  }
}
