import 'package:flutter/material.dart';
import 'package:nectar_ui/features/account/models/account_section.dart';
import 'package:nectar_ui/features/account/widgets/account_section.dart';
import 'package:nectar_ui/features/account/widgets/logout_button.dart';
import 'package:nectar_ui/features/account/widgets/profile_header.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeader(name: 'Afsar Hossen', email: 'Imshuvo97@gmail.com'),
            Divider(thickness: 1, color: Color(0xFFE0E0E0)),
            Expanded(
              child: ListView.separated(
                itemCount: accountSections.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return AccountSection(
                    accountSectionModel: accountSections[index],
                  );
                },
              ),
            ),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
