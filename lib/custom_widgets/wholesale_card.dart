import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class WholesaleCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String minOrder;

  const WholesaleCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.minOrder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Card(
        color: const Color(0xffEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: const Color(0xFFD9D9D9),
            width: 1,
          ),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2, 
                child: Center(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: AppStyles.getAppTextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    context: context,
                    fontFamily: 'nunito',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 2),

              Text(
                '$price с.',
                style: AppStyles.getAppTextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  context: context,
                  fontFamily: 'nunito',
                ),
              ),
              const SizedBox(height: 2),

              Text(
                'от $minOrder шт',
                style: AppStyles.getAppTextStyle(
                  color: const Color(0xff7A7B7C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  context: context,
                  fontFamily: 'nunito',
                ),
              ),
              const SizedBox(height: 8),

             ElevatedButton.icon(
                onPressed: () {},
                icon:  Image.asset(
                  'assets/icons/ic_cart_1.png',
                  fit: BoxFit.cover,
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
                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, 
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Color(0xff035D41), 
                      width: 1,         
                    ),
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