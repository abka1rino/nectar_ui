import 'package:flutter/material.dart';
import 'package:nectar_ui/core/utils/app_colors.dart';

class BottomSheetSection extends StatelessWidget {
  const BottomSheetSection({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  final String firstText;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.greyColor,
          ),
        ),
        Expanded(child: SizedBox()),
        Text(
          secondText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF181725),
          ),
        ),
        SizedBox(width: 10),
        Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF181725)),
        SizedBox(width: 10),
      ],
    );
  }
}
