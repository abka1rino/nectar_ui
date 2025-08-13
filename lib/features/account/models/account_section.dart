import 'package:nectar_ui/core/constants/app_assets.dart';

class AccountSectionModel {
  final String title;
  final String image;
  AccountSectionModel({required this.title, required this.image});
}

List<AccountSectionModel> accountSections = [
  AccountSectionModel(title: 'Orders', image: AppAssets.orderPng),
  AccountSectionModel(title: 'My Details', image: AppAssets.detailsPng),
  AccountSectionModel(
    title: 'Delivery Address',
    image: AppAssets.DeliceryaddressPng,
  ),
  AccountSectionModel(title: 'Payment Method', image: AppAssets.paymentPng),
  AccountSectionModel(title: 'Promo Code', image: AppAssets.voucherPng),
  AccountSectionModel(title: 'Notifications', image: AppAssets.bellPng),
  AccountSectionModel(title: 'Help', image: AppAssets.helpPng),
  AccountSectionModel(title: 'About', image: AppAssets.aboutPng),
];
