import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

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
  int _currentImageIndex = 0;
  int selectedIndex = 0;

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
      height: 530,
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                  bool isSelected = index == selectedIndex;
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
    height: 80,
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
                    '⭐️ ${widget.rating}',
                   style: AppStyles.getAppTextStyle(
                     context: context,
                     color: Color(0xff333331),
                     fontSize: 16,
                     fontWeight: FontWeight.w600,
                     fontFamily: 'workSans',
                   ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                widget.comment.toString() + ' Отзывов',
                style: AppStyles.getAppTextStyle(
                     context: context,
                     color: Color(0xff676764),
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
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/users/user1.jpg'),
            ),
            SizedBox(width: 4),
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/users/user2.jpg'),
            ),
            SizedBox(width: 4),
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/users/user3.jpg'),
            ),
            SizedBox(width: 4),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  '+36',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ],
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDFE0DF),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
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
                          Positioned(top: 15, left: 15, child: _buildBlurredIcon(Icons.arrow_back, () => Navigator.of(context).pop())),
                          Positioned(top: 15, right: 70, child: _buildBlurredIcon(Icons.favorite_border, () {})),
                          Positioned( top: 15, right: 15, child: _buildBlurredIcon(Icons.share, () {})),
                          Positioned( bottom: 5, left: 0, child: _buildBlurredText('${_currentImageIndex + 1}/${widget.imagePaths.length}')),
                          Positioned( bottom: 0, right: 0,
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
                  const SizedBox(height: 16),
                  _containerColorSelectionBlock(),
                  const SizedBox(height: 16),
                  _containerRatingAndCommentBlock(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
