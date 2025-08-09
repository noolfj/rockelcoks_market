import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rockelcoks_market/model/products_data.dart';
import 'package:rockelcoks_market/screens/main/products_info/product_bottom_sheet.dart';
import 'package:rockelcoks_market/screens/main/products_info/products_card_item.dart';
import 'package:rockelcoks_market/utils/app_button_auth.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';
import 'package:rockelcoks_market/screens/navbar.dart.dart'; 
import 'package:rockelcoks_market/screens/category/category_screen.dart';
import 'package:rockelcoks_market/screens/chat/chat_screen.dart';
import 'package:rockelcoks_market/screens/profile/profile_screen.dart';
import 'package:rockelcoks_market/screens/shop/shop_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final List<String> imagePaths;
  final String title;
  final String price;
  final String oldPrice;
  final String? rating;
  final String? comment;

  const ProductDetailScreen({
    Key? key,
    required this.imagePaths,
    required this.title,
    required this.price,
    required this.oldPrice,
    this.rating,
    this.comment,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedIndex = 0;
  int _currentImageIndex = 0;
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Container(), 
    CategoryScreen(),
    ShopScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _screens[0] = _buildProductDetailScreen();

    return Scaffold(
      backgroundColor: const Color(0xffDFE0DF),
      body: _screens[_selectedIndex], 
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildProductDetailScreen() {
        final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05, right:screenWidth * 0.05, top: screenHeight * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Stack(
                      children: [
                        _buildImageCarousel(),
                        Positioned(
                          top: 15,
                          left: 15,
                          child: _buildBlurredIcon(Icons.arrow_back, () => Navigator.of(context).pop()),
                        ),
                        Positioned(
                          top: 15,
                          right: 70,
                          child: _buildBlurredIcon(Icons.favorite_border, () {}),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: _buildBlurredIcon(Icons.share, () {}),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 0,
                          child: _buildBlurredText('${_currentImageIndex + 1}/${widget.imagePaths.length}'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
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
                _containerPriceBlock(),
                SizedBox(height: screenHeight * 0.02),
                _containerColorSelectionBlock(),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Expanded(child: _containerRatingAndCommentBlock()),
                    SizedBox(width: screenWidth * 0.05),
                    _containerQuestionsBlock(),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                _containerProductNameBlock(),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Wrap(
              spacing: 6,
              runSpacing: 12,
              children: (List.of(products)..shuffle(Random())).take(4).map((product) {
                return ProductCardItem(product: product);
              }).toList(),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          _containerButtonBlock(),
        ],
      ),
    );
  }

  Widget _buildBlurredIcon(IconData icon, VoidCallback onPressed) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }

  Widget _buildBlurredText(String text) {
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

  Widget _buildImageCarousel() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.58,
      width: double.infinity,
      child: PageView.builder(
        itemCount: widget.imagePaths.length,
        onPageChanged: (index) {
          setState(() {
            _currentImageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(
            widget.imagePaths[index],
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),
    );
  }

  Widget _containerPriceBlock() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02, vertical:  MediaQuery.of(context).size.height * 0.02),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                widget.price,
                style: AppStyles.getAppTextStyle(
                  color: const Color(0xff035D41),
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  context: context,
                  fontFamily: 'workSans',
                ),
              ),
              const SizedBox(width: 50),
              Text(
                widget.oldPrice,
                style: AppStyles.getAppTextStyle(
                  context: context,
                  color: const Color(0xff8BBCA6),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'workSans',
                  isStrikethrough: true,
                ),
              ),
            ],
          ),
          Text(
            '19 мая ›',
            style: AppStyles.getAppTextStyle(
              context: context,
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'workSans',
            ),
          ),
        ],
      ),
    );
  }

  Widget _containerColorSelectionBlock() {
    return Container(
      width: double.infinity,
      height: 115,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'белый›',
              style: AppStyles.getAppTextStyle(
                context: context,
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'workSans',
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.imagePaths.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            widget.imagePaths[index],
                            width: 50,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (index == selectedIndex)
                          Container(
                            width: 50,
                            height: 60,
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

  Widget _containerRatingAndCommentBlock() {
    return Container(
      width: 250,
      height: 75,
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04, vertical: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
                    Text(
                      '⭐️ ${widget.rating}',
                      style: AppStyles.getAppTextStyle(
                        context: context,
                        color: const Color(0xff333331),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'workSans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${widget.comment} Отзывов',
                  style: AppStyles.getAppTextStyle(
                    context: context,
                    color: const Color(0xff676764),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'workSans',
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Transform.translate(
                offset: const Offset(12, 0),
                child: Container(
                  width: 30,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage('assets/images/users/user1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-2, 0),
                child: Container(
                  width: 30,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage('assets/images/users/user2.jpg'),
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
                      width: 30,
                      height: 37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage('assets/images/users/user3.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 37,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '36+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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

  Widget _containerQuestionsBlock() {
    return Container(
      width: 120,
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
                    Text(
                      '15',
                      style: AppStyles.getAppTextStyle(
                        context: context,
                        color: const Color(0xff333331),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'workSans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Вопросов',
                  style: AppStyles.getAppTextStyle(
                    context: context,
                    color: const Color(0xff676764),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'workSans',
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

  Widget _containerProductNameBlock() {
    return Container(
      width: double.infinity,
      height: 95,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppStyles.getAppTextStyle(
              context: context,
              color: const Color(0xff333331),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'nunito',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 115,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Имя',
                      style: AppStyles.getAppTextStyle(
                        context: context,
                        color: const Color(0xff333331),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'workSans',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Продавец',
                          style: AppStyles.getAppTextStyle(
                            context: context,
                            color: const Color(0xff676764),
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'workSans',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '⭐️ 4.9›',
                          style: AppStyles.getAppTextStyle(
                            context: context,
                            color: const Color(0xff676764),
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'workSans',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
           Padding(
               padding: const EdgeInsets.only(bottom: 4),
               child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => DraggableScrollableSheet(
                        initialChildSize: 0.97,
                        minChildSize: 0.5,
                        maxChildSize: 0.97,
                        expand: false,
                        builder: (context, scrollController) {
                          return ProductDetailsBottomSheet(
                            scrollController: scrollController,
                          );
                        },
                      ),
                    );
                  },
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Text(
                       'о товаре',
                       style: AppStyles.getAppTextStyle(
                         context: context,
                         color: const Color(0xff035D41),
                         fontSize: 12,
                         fontWeight: FontWeight.w400,
                         fontFamily: 'workSans',
                       ),
                     ),
                     const SizedBox(width: 4),
                     Image.asset(
                       'assets/icons/ic_right_green.png',
                       height: 10,
                       width: 10,
                     ),
                   ],
                 ),
               ),
              ),
            ],
          ),
        ],
      ),
    );
  }

Widget _containerButtonBlock() {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
    height: 100,  
    padding: EdgeInsets.symmetric(horizontal: 20),  
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: CustomButtonAuth(
            text: 'Купить сейчас',
            textColor: Color(0xff035D41),
            backgroundColor: Color(0xff8BBCA6),
            borderColor: Colors.transparent,
            borderRadius: 10,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            fontFamily: 'agdasima',
            padding: const EdgeInsets.symmetric(vertical: 16),
            onPressed: () {
            },
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Expanded(
          child: CustomButtonAuth(
            text: 'В корзину',
            onPressed: () {
            },
            backgroundColor: Color(0xff035D41),
            borderRadius: 10,
            fontFamily: 'agdasima',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            borderColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    ),
  );
}

}