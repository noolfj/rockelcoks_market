import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rockelcoks_market/custom_widgets/seeAlso_card.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class WholesaleProductDetailScreen extends StatelessWidget {
  final List<String> imagePaths;
  final String title;
  final String price;
  final String oldPrice;
  final String? rating;
  final String? comment;
  final String minOrder; 

  const WholesaleProductDetailScreen({
    Key? key,
    required this.imagePaths,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.minOrder,
    this.rating,
    this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(),
                      child: Stack(
                        children: [
                          _buildImageCarousel(context),
                          Positioned(
                            top: 20,
                            left: 20,
                            child: _buildBlurredIcon(Icons.arrow_back, () => Navigator.of(context).pop()),
                          ),
                          Positioned(
                            top: 20,
                            right: 70,
                            child: _buildBlurredIcon(Icons.favorite_border, () {}),
                          ),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: _buildBlurredIcon(Icons.share, () {}),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 0,
                            child: _buildBlurredText('${imagePaths.length > 0 ? 1 : 0}/${imagePaths.length}', context),
                          ),
                          Positioned(
                            bottom: 12,
                            right: 12,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/icons/ic_search1.png',
                                        height: 18,
                                        width: 22,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Похожие',
                                        style: AppStyles.getAppTextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          context: context,
                                          fontFamily: 'workSans',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _containerPriceBlok(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _containerColorSelectionBlok(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      Expanded(child: _containerRatingAndCommentBlok(context)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      _containerQuestionsBlok(context),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _containerProductInfoBlok(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _containerSeeAlso(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlurredIcon(IconData icon, VoidCallback onPressed) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.black),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }

  Widget _buildBlurredText(String text,BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: AppStyles.getAppTextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              context: context, 
              fontFamily: 'workSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel(BuildContext context) {
    int currentImageIndex = 0;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.58,
      width: double.infinity,
      child: PageView.builder(
        itemCount: imagePaths.length,
        onPageChanged: (index) {
          currentImageIndex = index; 
        },
        itemBuilder: (context, index) {
          return Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),
    );
  }

  Widget _containerPriceBlok(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                    Image.asset(
                     'assets/icons/ic_sale_red.png',
                     height: 12,
                     width: 12,
                   ),
                   SizedBox(width: 4),
                  Text(
                    '${price} c',
                    style: AppStyles.getAppTextStyle(
                      color: const Color(0xffFF4444),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      context: context,
                      fontFamily: 'nunito',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    oldPrice,
                     style: AppStyles.getAppTextStyle(
                      color: const Color(0xff868695),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      context: context,
                      fontFamily: 'nunito',
                      lineHeight: 0.2,
                      isStrikethrough: true
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff035D41), 
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2), 
                child: Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    Image.asset(
                      'assets/icons/ic_like_green.png',
                      height: 12,
                      width: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Хорошая цена',
                      style: AppStyles.getAppTextStyle(
                        context: context,
                        color: Color(0xff242424),
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'nunito',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        const Spacer(), 
         ElevatedButton.icon(
           onPressed: () {},
           icon: Image.asset(
             'assets/icons/ic_cart_1.png',
             height: 25,
             width: 25,
           ),
           label:  Text('В корзину', style: AppStyles.getAppTextStyle(
                color: const Color(0xff035D41),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                context: context,
                fontFamily: 'nunito',
                letterSpacing: -0.6
              ),
            ),
            style: ElevatedButton.styleFrom(
             backgroundColor: Colors.transparent,
             elevation: 0,
             minimumSize: const Size(110, 40),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30),
               side: const BorderSide(color: Color(0xff035D41), width: 1),
             ),
           ),
         ),
        ],
      ),
    );
  }

  Widget _containerColorSelectionBlok(BuildContext context) {
    int selectedIndex = 0; 
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Цвет: ',
                  style: AppStyles.getAppTextStyle(
                    context: context,
                    color: Color(0xff868695),
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'nunito',
                  ),
                ),
                Text(
                  'черный',
                  style: AppStyles.getAppTextStyle(
                    context: context,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'nunito',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: imagePaths.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = index; 
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imagePaths[index],
                            width: 56,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (index == selectedIndex)
                          Container(
                           width: 56,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black.withOpacity(0.3),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _containerRatingAndCommentBlok(BuildContext context) {
    return Container(
      width: 250,
      height: 75,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/ic_star1.png', 
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4), 
                  Text(
                    '${rating ?? 'N/A'}',
                    style: AppStyles.getAppTextStyle(
                      context: context,
                      color: const Color(0xff242424),
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'roboto',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '${comment ?? '0'} оценок',
                    style: AppStyles.getAppTextStyle(
                      context: context,
                      color: const Color(0xff868695),
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'nunito',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
          Row(
            children: [
              Transform.translate(
                offset: const Offset(12, 0),
                child: Container(
                  width: 35,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage('assets/images/products/plita3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-2, 0),
                child: Container(
                  width: 35,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage('assets/images/products/plita2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-16, 0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                      image: AssetImage('assets/images/products/plita1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '99+',
                    style: AppStyles.getAppTextStyle(
                      context: context,
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'roboto',
                    ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/icons/ic_right.png',
                height: 12,
                width: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _containerQuestionsBlok(BuildContext context) {
    return Container(
      width: 120,
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

               Row(
                 children: [
                   Image.asset(
                     'assets/icons/ic_question1.png', 
                     width: 16,
                     height: 16,
                   ),
                   const SizedBox(width: 4), 
                   Text(
                     '234',
                     style: AppStyles.getAppTextStyle(
                       context: context,
                       color: const Color(0xff242424),
                       fontSize: 18,
                       fontWeight: FontWeight.w100,
                       fontFamily: 'roboto',
                     ),
                   ),
                 ],
                ),
                const SizedBox(height: 4),
                Text(
                  'вопросов',
                   style: AppStyles.getAppTextStyle(
                    context: context,
                    color: const Color(0xff868695),
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'nunito',
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/icons/ic_right.png',
            height: 12,
            width: 12,
          ),
        ],
      ),
    );
  }

Widget _containerProductInfoBlok(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Характеристики и описание',
              style: AppStyles.getAppTextStyle(
                context: context,
                color: const Color(0xff242424),
                fontSize: 18,
                fontWeight: FontWeight.w200,
                fontFamily: 'ibmplexsans',
              ),
            ),
           Image.asset(
            'assets/icons/ic_right.png',
            height: 12,
            width: 12,
          ),
          ],
        ),
        const SizedBox(height: 12),
       _characteristicProductRow(context, 'Количество', 'От 10 шт.'),
       _characteristicProductRow(context, 'Количество конфорок', '2 шт.'),
       _characteristicProductRow(context, 'Тип варочной панели', 'Электрическая'),
       _characteristicProductRow(context, 'Тип рабочей поверхности', 'Стеклокерамика'),
       _characteristicProductRow(context, 'Модель', 'СЕН301'),
       _characteristicProductRow(context, 'Гарантийный срок', '2 года'),
       _characteristicProductRow(context, 'Управление', 'сенсорное'),
      ]
    ),
  );
}



Widget _characteristicProductRow(BuildContext context, String name, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.45, 
          child: Text(
            name,
            style: AppStyles.getAppTextStyle(
              context: context,
              color: const Color(0xff868695),
              fontSize: 14,
              fontWeight: FontWeight.w200,
              fontFamily: 'nunito',
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppStyles.getAppTextStyle(
              context: context,
              color: const Color(0xff242424),
              fontSize: 14,
              fontWeight: FontWeight.w300,
              fontFamily: 'ibmplexsans',
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _containerSeeAlso(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Смотрите также',
          style: AppStyles.getAppTextStyle(
            context: context,
            color: const Color(0xff242424),
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'roboto',
          ),
        ),
        const SizedBox(height: 20),
Wrap(
  spacing: 6,
  runSpacing: 6,
  children: [
    SizedBox(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WholesaleProductDetailScreen(
                imagePaths: ['assets/images/products/pl1.png', 'assets/images/products/pl1.png', 'assets/images/products/pl1.png'],
                title: 'Электрическая варочная панель KRONA EDIEL 38 BL TK',
                price: '656',
                oldPrice: '1222',
                rating: '5.0',
                comment: '30',
                minOrder: '1',
              ),
            ),
          );
        },
        child: const SeeAlsoCard(
          imagePath: 'assets/images/products/pl1.png',
          title: 'Электрическая варочная панель KRONA EDIEL 38 BL TK',
          price: '656',
          oldPrice: '1222',
          minOrder: '1',
          factoryName: 'KRONA',
          rating: '5.0', 
          grade: '30',
        ),
      ),
    ),
    SizedBox(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WholesaleProductDetailScreen(
                imagePaths: ['assets/images/products/pl3.png', 'assets/images/products/pl3.png', 'assets/images/products/pl3.png'],
                title: 'Индукционная варочная панель Comfee',
                price: '533',
                oldPrice: '1212',
                rating: '4.8',
                comment: '596',
                minOrder: '1',
              ),
            ),
          );
        },
        child: const SeeAlsoCard(
          imagePath: 'assets/images/products/pl3.png',
          title: 'Индукционная варочная панель Comfee',
          price: '533',
          oldPrice: '1212',
          minOrder: '1',
          factoryName: 'Comfee',
          rating: '4.8',
          grade: '596',

        ),
      ),
    ),
    SizedBox(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WholesaleProductDetailScreen(
                imagePaths: ['assets/images/products/pl2.png', 'assets/images/products/pl2.png', 'assets/images/products/pl2.png'],
                title: 'Электрическая варочная панель DEXP 4M2CTYL/B',
                price: '480',
                oldPrice: '1300',
                rating: '4.9',
                comment: '109',
                minOrder: '1',
              ),
            ),
          );
        },
        child: const SeeAlsoCard(
          imagePath: 'assets/images/products/pl2.png',
          title: 'Варочная панель DEXP 4M2CTYL/B',
          price: '480',
          oldPrice: '1300',
          minOrder: '1',
          factoryName: 'DEXP',
          rating: '4.9',
          grade: '109',

        ),
      ),
    ),
    SizedBox(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WholesaleProductDetailScreen(
                imagePaths: ['assets/images/products/pl3.png', 'assets/images/products/pl3.png', 'assets/images/products/pl3.png'],
                title: 'Индукционная варочная панель Comfee',
                price: '540',
                oldPrice: '1200',
                rating: '4.8',
                comment: '596',
                minOrder: '1',
              ),
            ),
          );
        },
        child: const SeeAlsoCard(
          imagePath: 'assets/images/products/pl3.png',
          title: 'Индукционная варочная панель Comfee',
          price: '540',
          oldPrice: '1200',
          minOrder: '1',
          factoryName: 'Comfee',
          rating: '4.8',
          grade: '596',

        ),
      ),
    ),
  ],
),
      ],
    ),
  );
}


}