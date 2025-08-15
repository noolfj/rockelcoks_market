import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class BusinessCard extends StatelessWidget {
  final String name;
  final double rating;
  final int reviewsCount;
  final String description;
  final String location;
  final bool isVerified;

  const BusinessCard({
    super.key,
    required this.name,
    required this.rating,
    required this.reviewsCount,
    required this.description,
    required this.location,
    this.isVerified = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Color(0xffD9D9D9), 
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:  Colors.black, 
                          width: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: AppStyles.getAppTextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            context: context,
                            fontFamily: 'nunito',
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (isVerified)
                          Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xffE9F7FF),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            'Проверенный поставщик',
                            style: AppStyles.getAppTextStyle(
                            color: Color(0xff035D41),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            context: context,
                            fontFamily: 'nunito',
                          ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                if (isVerified)
                 Image.asset(
                 'assets/icons/ic_verf.png',
                 height: 27,
                 width: 23,
               ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 60), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: AppStyles.getAppTextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      context: context,
                      fontFamily: 'nunito',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: AppStyles.getAppTextStyle(
                      color: Color(0xff7A7B7C),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      context: context,
                      fontFamily: 'nunito',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: AppStyles.getAppTextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        context: context,
                        fontFamily: 'nunito',
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '($reviewsCount)',
                      style: AppStyles.getAppTextStyle(
                        color: Color(0xff7A7B7C),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        context: context,
                        fontFamily: 'nunito',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff035D41),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                    minimumSize: const Size(100, 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'Отправить запрос',
                    style: AppStyles.getAppTextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      context: context,
                      fontFamily: 'nunito',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}