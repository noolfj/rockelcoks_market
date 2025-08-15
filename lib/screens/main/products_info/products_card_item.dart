import 'package:flutter/material.dart';
import 'package:rockelcoks_market/custom_widgets/products_card.dart';
import 'package:rockelcoks_market/screens/main/products_info/products_details_screen.dart';
import 'package:rockelcoks_market/utils/custom_navigate_push.dart';

class ProductCardItem extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCardItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 12 * 2 - 10) / 2, 
      child: ProductCard(
        imagePath: (product['imagePaths'] as List<String>)[0],
        title: product['title'] as String,
        price: product['price'] as String,
        oldPrice: product['oldPrice'] as String,
        badgeText: product['badgeText'] as String,
        saleText: product['saleText'] as String?,
        rating: product['rating'] as String,
        comment: product['comment'] as String,
        onTap: () {
          customNavigatePushWithFade(context, ProductDetailScreen(
            imagePaths: List<String>.from(product['imagePaths'] as List),
            title: product['title'] as String,
            price: product['price'] as String,
            oldPrice: product['oldPrice'] as String,
            rating: product['rating'] as String,
            comment: product['comment'] as String,
          ),);
        },
      ),
    );
  }
}
