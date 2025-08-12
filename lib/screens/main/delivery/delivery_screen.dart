import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/main/delivery/delivery_address_screen.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leadingWidth: 50, 
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0), 
          child: IconButton(
            icon: Image.asset(
              'assets/icons/ic_left.png',
              width: 10,
              height: 20,
              color: Colors.black, 
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Выбор Способа Доставки',
                style: AppStyles.getAppTextStyle(
                 color: Colors.black,
                 fontSize: 20,
                 fontWeight: FontWeight.w700,
                 context: context,
                 fontFamily: 'poppins',
               ),
              ),
              SizedBox(height: 4),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 27,
                        color: Colors.black,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Пункт Выдачи',
                        style: AppStyles.getAppTextStyle(
                         color: Color(0xff333331),
                         fontSize: 20,
                         fontWeight: FontWeight.w700,
                         context: context,
                         fontFamily: 'poppins',
                       ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.015),
          child: Container(
            color: Color(0xff9B9292),
            height: 2,
          ),
        ),
      ),

      body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          SizedBox(
            width: 202,
            height: 202,
            child: Image.asset('assets/icons/ic_delivery.png'), 
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'Ваши пункты выдачи \nпоявятся здесь',
             style: AppStyles.getAppTextStyle(
               color: Colors.black,
               fontSize: 20,
               fontWeight: FontWeight.w600,
               context: context,
               fontFamily: 'inter',
             ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          Text(
            'Добавь удобный пункт, чтобы видеть \nактуальные товары и сроки доставки \n— всё под рукой, как тебе удобно.',
             style: AppStyles.getAppTextStyle(
               color: Color(0xff4B4B4C),
               fontSize: 12,
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
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => DeliveryAddressScreen()),
                 );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff355D3A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Выбрать пункт',
                 style: AppStyles.getAppTextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  context: context,
                  fontFamily: 'poppins',
                ),
              ),
            ),
          ),
          SizedBox(height: 30), 
        ],
      ),
    ),
    );
  }
}
