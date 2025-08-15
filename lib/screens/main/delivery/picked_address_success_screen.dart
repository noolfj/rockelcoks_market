import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/main/delivery/delivery_screen_test.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';
import 'package:rockelcoks_market/utils/custom_navigate_push.dart';

class PickedAddressSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.12),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),

          Text(
            'Точка отмечена \nВсё готово к покупкам!',
             style: AppStyles.getAppTextStyle(
               color: Colors.black,
               fontSize: 20,
               fontWeight: FontWeight.w600,
               context: context,
               fontFamily: 'poppins',
               letterSpacing: -1
             ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset('assets/icons/ic_location_ok.png'), 
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'Этот адрес будет использоваться \nдля расчёта доставки.',
             style: AppStyles.getAppTextStyle(
               color: Colors.black,
               fontSize: 17,
               fontWeight: FontWeight.w600,
               context: context,
               fontFamily: 'inter',
             ),
            textAlign: TextAlign.center,
          ),
        
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                customNavigatePushWithFade(context, DeliveryTestScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff355D3A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Продолжить',
                 style: AppStyles.getAppTextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  context: context,
                  fontFamily: 'poppins',
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                 Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Color(0xff355D3A),
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                'Отмена',
                 style: AppStyles.getAppTextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  context: context,
                  fontFamily: 'agdasima',
                ),
              ),
            ),
          ),
         SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          Text(
            'Мы не передаём ваши данные. \nАдрес нужен только для \nрасчёта доставки.',
             style: AppStyles.getAppTextStyle(
               color: Color(0xff6F6F70),
               fontSize: 15,
               fontWeight: FontWeight.w600,
               context: context,
               fontFamily: 'inter',
             ),
            textAlign: TextAlign.center,
          ),        ],
      ),
    ),
    );
  }
}
