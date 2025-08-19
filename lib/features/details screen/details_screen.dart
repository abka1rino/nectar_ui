import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_ui/components/buttons/main_button.dart';
import 'package:nectar_ui/core/constants/app_assets.dart';
import 'package:nectar_ui/core/services/product_service.dart';
import 'package:nectar_ui/core/utils/app_colors.dart';
import 'package:nectar_ui/features/home/models/product_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;
  @override
  State<DetailsScreen> createState() => _State();
}

class _State extends State<DetailsScreen> {
  bool isFavorite = false;
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2F3F2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.ios_share,
                          color: isFavorite
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                        ),
                        onPressed: () {
                          // Navigate to cart screen
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Hero(
                    tag: widget.product.image,
                    child: Image.asset(
                      widget.product.image,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 10,
                bottom: 10,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          AppAssets.favouriteSvg,
                          colorFilter: isFavorite
                              ? ColorFilter.mode(
                                  AppColors.primaryColor,
                                  BlendMode.srcIn,
                                )
                              : ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    widget.product.subtitle,
                    style: TextStyle(fontSize: 16, color: Color(0xFF7C7C7C)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (itemCount > 1) itemCount--;
                              });
                            },
                            child: Icon(
                              Icons.remove,
                              color: itemCount > 1
                                  ? AppColors.primaryColor
                                  : AppColors.greyColor,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE2E2E2)),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Center(
                              child: Text(
                                itemCount.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                itemCount++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${(double.parse(widget.product.price.replaceAll('\$', '')) * itemCount).toString()}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1, endIndent: 5, indent: 5),
                  SizedBox(height: 10),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${widget.product.title}s are nutritious. They may be good for weight loss. They may be good for your heart. As part of a healthy and varied diet.',
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1, endIndent: 5, indent: 5),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  MainButton(
                    text: 'Add to Cart',
                    onPressed: () {
                      for (var v = 0; v < itemCount; v++) {
                        ProductService.addToCart(
                          widget.product,
                          cartItems,
                          cartItemCount,
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${widget.product.title} added to cart!',
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
