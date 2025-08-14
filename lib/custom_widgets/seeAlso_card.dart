import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class SeeAlsoCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String oldPrice;
  final String minOrder;
  final String factoryName;
  final String rating; 
  final String grade; 

  const SeeAlsoCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.minOrder,
    required this.factoryName,
    required this.rating,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffEDEDED),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
             child: ClipRRect(
               borderRadius: BorderRadius.circular(12),
               child: SizedBox(
                 width: double.infinity,
                 height: 240,
                 child: Image.asset(
                   imagePath,
                   fit: BoxFit.fill,
                 ),
               ),
             ),
           ),

            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                 Row(
                    children: [
                      Image.asset(
                        'assets/icons/ic_sale_green.png',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$price с.',
                        style: AppStyles.getAppTextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          context: context,
                          fontFamily: 'ibmplexsans',
                        ),
                      ),
                      const SizedBox(width: 12), 
                      Text(
                        oldPrice,
                        style: AppStyles.getAppTextStyle(
                          color: Color(0xff868695),
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          context: context,
                          fontFamily: 'roboto',
                          isStrikethrough: true
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/ic_check1.png',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                     Expanded(
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$factoryName / ',
                              style: AppStyles.getAppTextStyle(
                                color: const Color(0xff242424), 
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                                context: context,
                                fontFamily: 'roboto',
                              ),
                            ),
                            TextSpan(
                              text: title,
                              style: AppStyles.getAppTextStyle(
                                color: const Color(0xff9D9DA5),
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                context: context,
                                fontFamily: 'roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                   ],
                  ),

                  const SizedBox(height: 4),

                Row(
                  children: [
                    Image.asset(
                      'assets/icons/ic_star1.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                   Expanded(
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$rating * ',
                              style: AppStyles.getAppTextStyle(
                                color: const Color(0xff242424), 
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                context: context,
                                fontFamily: 'roboto',
                              ),
                            ),
                            TextSpan(
                              text: '$grade оценок',
                              style: AppStyles.getAppTextStyle(
                                color: const Color(0xff9D9DA5),
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                context: context,
                                fontFamily: 'roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/ic_cart_1.png',
                            height: 18,
                            width: 18,
                            color: const Color(0xff035D41),
                          ),
                          label: Text(
                            'В корзину',
                            style: AppStyles.getAppTextStyle(
                              color: const Color(0xff035D41),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontFamily: 'nunito',
                              letterSpacing: -0.6,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                color: Color(0xff035D41),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/ic_heart.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
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