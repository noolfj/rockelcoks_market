import 'package:flutter/material.dart';
import 'package:rockelcoks_market/custom_widgets/buisness_card.dart';
import 'package:rockelcoks_market/screens/main/business_product/search_buisness_product.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class BusinessProductsScreen extends StatelessWidget {
  const BusinessProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      appBar: AppBar(
        backgroundColor: const Color(0xffEDEDED),
        forceMaterialTransparency: true,
        title: Text(
          'Бизнес товары',
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBusinessWidget(popularSearches: [], recommendedSearches: []),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Новое на платформе',
                style: AppStyles.getAppTextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  context: context,
                  fontFamily: 'nunito',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                '8 новых поставщиков за эту неделю',
                style: AppStyles.getAppTextStyle(
                  color: const Color(0xff7A7B7C),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  context: context,
                  fontFamily: 'nunito',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                },
                child: Text(
                  'Узнать больше',
                  style: AppStyles.getAppTextStyle(
                    color: const Color(0xff0052CC),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    context: context,
                    fontFamily: 'inter',
                  ),
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                BusinessCard(
                  key: UniqueKey(),
                  name: 'Электромаркет',
                  rating: 4.3,
                  reviewsCount: 29,
                  description: 'Компьютеры и разная техника\nОт 100 шт',
                  location: 'Россия, Иваново',
                  isVerified: true,
                ),
                BusinessCard(
                  key: UniqueKey(),
                  name: 'ТексТиль ОПТ',
                  rating: 4.5,
                  reviewsCount: 45,
                  description: 'Оптовые текстили\nОт 100 шт в России и зарубеж.',
                  location: 'Россия, Москва',
                  isVerified: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Поставщики',
                    style: AppStyles.getAppTextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      context: context,
                      fontFamily: 'nunito',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    '+12 Узнать больше',
                    style: AppStyles.getAppTextStyle(
                      color: const Color(0xff0052CC),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      context: context,
                      fontFamily: 'inter',
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                BusinessCard(
                  key: UniqueKey(),
                  name: 'Электромаркет',
                  rating: 4.3,
                  reviewsCount: 29,
                  description: 'Компьютеры и разная техника\nОт 100 шт',
                  location: 'Россия, Иваново',
                  isVerified: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}