import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class ProductCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final String oldPrice;
  final String badgeText;
  final String? saleText;
  final String? rating;
  final String? comment;
  final VoidCallback? onTap;

  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.badgeText,
    required this.rating,
    required this.comment,
    this.saleText,
     this.onTap,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

return Padding(
  padding: EdgeInsets.only(
    left: screenWidth * 0.018,
    right: screenWidth * 0.018,
    bottom: screenHeight * 0.01,
  ),
  child: GestureDetector(
    onTap: widget.onTap,
    child: Container(
        height: screenHeight * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(0),
                      ),
                      child: Image.asset(
                        widget.imagePath,
                        height: screenHeight * 0.21,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CustomPaint(
                        size: const Size(double.infinity, 20),
                        painter: DiagonalPainter(),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.17,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8BBCA6),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                          ),
                        ),
                        child: Text(
                          widget.badgeText,
                          style: AppStyles.getAppTextStyle(
                            context: context,
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'workSans',
                          ),
                        ),
                      ),
                    ),
                    if (widget.saleText != null && widget.saleText!.isNotEmpty)
                      Positioned(
                        top: screenHeight * 0.145,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFBD8C1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            widget.saleText!,
                            style: AppStyles.getAppTextStyle(
                              context: context,
                              color: const Color(0xff333331),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'workSans',
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.03,
                      right: screenWidth * 0.12,
                      top: 2,
                      bottom: 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${widget.price}с',
                                  style: AppStyles.getAppTextStyle(
                                    context: context,
                                    color: const Color(0xff035D41),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'workSans',
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${widget.oldPrice}с',
                                  style: AppStyles.getAppTextStyle(
                                    context: context,
                                    color: const Color(0xff8BBCA6),
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'workSans',
                                    isStrikethrough: true,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.getAppTextStyle(
                                context: context,
                                color: const Color(0xff333331),
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'nunito',
                                letterSpacing: -0.5,
                                lineHeight: 0.9,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '⭐️ ${widget.rating} ',
                                      style: AppStyles.getAppTextStyle(
                                        context: context,
                                        color: const Color(0xff333331),
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'workSans',
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(${widget.comment} отзывов)',
                                      style: AppStyles.getAppTextStyle(
                                        context: context,
                                        color: const Color(0xff676764),
                                        fontSize: 4,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'workSans',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 6,
              right: 6,
              child: FloatingActionButton(
                heroTag: 'cartButton-${widget.title}', 
                onPressed: () {},
                mini: true,
                backgroundColor: const Color(0xFF8BBCA6),
                elevation: 0,
                highlightElevation: 0,
                shape: const CircleBorder(),
                child: Image.asset(
                  'assets/icons/ic_cart.png',
                  width: 14,
                  height: 14,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
);
  }
}

class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
