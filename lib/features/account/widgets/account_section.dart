import 'package:flutter/material.dart';
import 'package:nectar_ui/features/account/models/account_section.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key, required this.accountSectionModel});
  final AccountSectionModel accountSectionModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          SizedBox(width: 10),
          Image.asset(accountSectionModel.image, color: Color(0xFF181725)),
          SizedBox(width: 15),
          Text(
            accountSectionModel.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF181725),
            ),
          ),
          Expanded(child: SizedBox()),
          Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF181725)),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
