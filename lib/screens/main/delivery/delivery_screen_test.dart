import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/home_screen.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class DeliveryTestScreen extends StatelessWidget {
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
             Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false,
            );
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.15),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 92,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xff355D3A), width: 2),
                            image: DecorationImage(
                              image: AssetImage('assets/images/bg_map.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 12),
                              Icon(Icons.location_on_outlined, size: 28),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  'улица К. Хучанди 163',
                                  style: AppStyles.getAppTextStyle(
                                    color: Color(0xff171616),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    context: context,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: -50,
                          top: 92 / 2 - 1,
                          child: Container(
                            height: 4,
                            width: 30,
                            color: Color(0xff355D3A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              alignment: Alignment.center,
              child: SizedBox(
                width: 280,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff355D3A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    '+ добавить адрес',
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
            ),
          ],
        ),
      ),
    );
  }
}