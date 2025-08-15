import 'package:flutter/material.dart';
import 'package:rockelcoks_market/custom_widgets/wholesale_card.dart';
import 'package:rockelcoks_market/screens/main/wholesale_product/search_wholesale.dart';
import 'package:rockelcoks_market/screens/main/wholesale_product/wholesale_products_details_screen.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';
import 'package:rockelcoks_market/utils/custom_navigate_push.dart';

class WholesaleProductsScreen extends StatelessWidget {
  WholesaleProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      appBar: AppBar(
        backgroundColor: const Color(0xffEDEDED),
        forceMaterialTransparency: true,
        title: Text(
          'Оптовые товары',
          style: AppStyles.getAppTextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w600,
            context: context,
            fontFamily: 'nunito',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWholesaleWidget(
              popularSearches: [],
              recommendedSearches: [],
            ),
            const SizedBox(height: 16),
            Text(
              'Популярные оптовые позиции',
              style: AppStyles.getAppTextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                context: context,
                fontFamily: 'nunito',
              ),
            ),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.65,
              children: [
                GestureDetector(
                  onTap: () {
                    customNavigatePushWithFade(
                      context,
                      WholesaleProductDetailScreen(
                        imagePaths: [
                          'assets/images/products/air_pods.png',
                          'assets/images/products/air_pods.png',
                          'assets/images/products/air_pods.png'
                        ],
                        title: 'Наушники AirPods 2 Pro',
                        price: '220',
                        oldPrice: '300', 
                        rating: '4.5', 
                        comment: '120', 
                        minOrder: '10', 
                      ),
                    );
                  },
                  child: const WholesaleCard(
                    imagePath: 'assets/images/products/air_pods.png',
                    title: 'Наушники AirPods 2 Pro',
                    price: '220',
                    minOrder: '10',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    customNavigatePushWithFade(
                      context,
                      WholesaleProductDetailScreen(
                        imagePaths: [
                          'assets/images/products/kros_nike.png',
                          'assets/images/products/kros_nike.png',
                          'assets/images/products/kros_nike.png'
                        ],
                        title: 'Кроссовки Nike',
                        price: '350',
                        oldPrice: '450',
                        rating: '4.8',
                        comment: '200',
                        minOrder: '10',
                      ),
                    );
                  },
                  child: const WholesaleCard(
                    imagePath: 'assets/images/products/kros_nike.png',
                    title: 'Кроссовки Nike',
                    price: '350',
                    minOrder: '10',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    customNavigatePushWithFade(
                      context,
                      WholesaleProductDetailScreen(
                        imagePaths: [
                          'assets/images/products/sviter.png',
                          'assets/images/products/sviter.png',
                          'assets/images/products/sviter.png'
                        ],
                        title: 'Свитер Nike',
                        price: '220',
                        oldPrice: '280',
                        rating: '4.2',
                        comment: '80',
                        minOrder: '10',
                      ),
                    );
                  },
                  child: const WholesaleCard(
                    imagePath: 'assets/images/products/sviter.png',
                    title: 'Свитер Nike',
                    price: '220',
                    minOrder: '10',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    customNavigatePushWithFade(
                      context,
                      WholesaleProductDetailScreen(
                        imagePaths: [
                          'assets/images/products/air_pods.png',
                          'assets/images/products/air_pods.png',
                          'assets/images/products/air_pods.png'
                        ],
                        title: 'Наушники AirPods 2 Pro',
                        price: '220',
                        oldPrice: '300',
                        rating: '4.5',
                        comment: '120',
                        minOrder: '10',
                      ),
                    );
                  },
                  child: const WholesaleCard(
                    imagePath: 'assets/images/products/air_pods.png',
                    title: 'Наушники AirPods 2 Pro',
                    price: '220',
                    minOrder: '10',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Специально для вас',
              style: AppStyles.getAppTextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                context: context,
                fontFamily: 'nunito',
              ),
            ),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.65,
              children: [
                GestureDetector(
                  onTap: () {
                    customNavigatePushWithFade(
                      context,
                      WholesaleProductDetailScreen(
                        imagePaths: ['assets/images/products/kros_nike.png'],
                        title: 'Кроссовки',
                        price: '320',
                        oldPrice: '400',
                        rating: '4.7',
                        comment: '150',
                        minOrder: '10',
                      ),
                    );
                  },
                  child: const WholesaleCard(
                    imagePath: 'assets/images/products/kros_nike.png',
                    title: 'Кроссовки',
                    price: '320',
                    minOrder: '10',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    customNavigatePushWithFade(
                      context,
                      WholesaleProductDetailScreen(
                        imagePaths: ['assets/images/products/sviter.png'],
                        title: 'Толстовка Champion',
                        price: '280',
                        oldPrice: '350',
                        rating: '4.3',
                        comment: '90',
                        minOrder: '10',
                      ),
                    );
                  },
                  child: const WholesaleCard(
                    imagePath: 'assets/images/products/sviter.png',
                    title: 'Толстовка Champion',
                    price: '280',
                    minOrder: '10',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
