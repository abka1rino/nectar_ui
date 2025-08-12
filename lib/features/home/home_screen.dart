import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_ui/components/inputs/custom_search_text_form_field.dart';
import 'package:nectar_ui/core/constants/app_assets.dart';
import 'package:nectar_ui/core/utils/app_colors.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';
import 'package:nectar_ui/features/home/widgets/collection_header.dart';
import 'package:nectar_ui/features/home/widgets/exclusive_product_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SvgPicture.asset(
          width: 150,
          height: 56,
          AppAssets.logoSvg,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              CustomSearchTextFormField(
                prefixIcon: Icon(Icons.search),
                labelText: "Search Store",
              ),
              SizedBox(height: 16.0),
              CollectionHeader(title: 'Exclusive', buttonText: 'See All'),
              SizedBox(height: 8.0),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: exclusiveProducts.length,
                  itemBuilder: (context, index) {
                    return ExclusiveCard(product: exclusiveProducts[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.0);
                  },
                ),
              ),
              SizedBox(height: 8.0),
              CollectionHeader(title: 'Best Selling', buttonText: 'See All'),
              SizedBox(height: 8.0),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: .91,
                ),
                itemCount: exclusiveProducts.length,
                itemBuilder: (context, index) {
                  return ExclusiveCard(product: exclusiveProducts[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
