import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/main/delivery/map_screen.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class DeliveryAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        toolbarHeight: 60,
        leadingWidth: 50,
        leading: IconButton(
          icon: Image.asset('assets/icons/ic_left.png', width: 10, height: 20, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Выбор способа доставки',
          style: AppStyles.getAppTextStyle(
           color: Color(0xff242424),
           fontSize: 20,
           fontWeight: FontWeight.w600,
           context: context,
           fontFamily: 'poppins',
         ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(color: Color(0xffC4C4C4), height: 2.5),
        ),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Доступные пункты',
            style: AppStyles.getAppTextStyle(
               color: Color(0xff242424),
               fontSize: 20,
               fontWeight: FontWeight.w600,
               context: context,
               fontFamily: 'poppins',
             ),
            ),
            SizedBox(height: 4),
            Text(
              'Выберите ближайший пункт получения заказа',
              style: AppStyles.getAppTextStyle(
                color: Color(0xff676764),
                fontSize: 15,
                fontWeight: FontWeight.w600,
                context: context,
                fontFamily: 'poppins',
              ),
            ),
            SizedBox(height: 16),
    
            deliveryPoint(
              city: 'Хучанд',
              address: 'Улица ...',
              schedule: '8:00 – 20:30',
              context: context,
            ),
            deliveryPoint(
              city: 'Душанбе',
              address: 'Улица ...',
              schedule: '9:00 – 20:30',
              context: context,

            ),
            deliveryPoint(
              city: 'Истаравшан',
              address: 'Улица ...',
              schedule: '8:30 – 19:30',
              context: context,

            ),
    
            SizedBox(height: 24),
           Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 280,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff355D3A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12) ,
                        ),
                      ),
                      child: Text(
                        'Выбрать пункт',
                        style: AppStyles.getAppTextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          context: context,
                          fontFamily: 'agdasama',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: 280,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapScreen()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xff355D3A), width: 2 ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Показать на карте',
                        style: AppStyles.getAppTextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          context: context,
                          fontFamily: 'agdasama',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    
          SizedBox(height: 30),

            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  );
                },
                child: Container(
                  height: 212,
                  width: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xff355D3A), width: 2),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_map.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/ic_location.png',
                          width: 64,
                          height: 64,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'На этой карте вы можете увидеть\nрасположение пункта выдачи',
                          textAlign: TextAlign.center,
                          style: AppStyles.getAppTextStyle(
                            color: Color(0xff4B4B4C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            context: context,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24),
    
            Text(
              'Отзывы о пунктах выдачи',
              style: AppStyles.getAppTextStyle(
                color: Color(0xff333331),
                fontSize: 17,
                fontWeight: FontWeight.w600,
                context: context,
                fontFamily: 'poppins',
              ),
            ),
            Text(
              'что говорят другие пользователи',
              style: AppStyles.getAppTextStyle(
                color: Color(0xff676764),
                fontSize: 15,
                fontWeight: FontWeight.w600,
                context: context,
                fontFamily: 'poppins',
              ),
            ),
    
            SizedBox(height: 16),
    
            Row(
              children: [
                review(
                  name: 'Александр',
                  text: 'Хороший сервис,вежливые сотрудники',
                  stars: 5,
                  avatarLetter: 'А',
                  context: context
                ),
                SizedBox(width: 12),
                review(
                  name: 'Ира',
                  text: 'Очень быстро и удобно\nЯ довольна',
                  stars: 3,
                  avatarLetter: 'И',
                  context: context
                ),
              ],
            ),

           SizedBox(height: 16),

          ],
        ),
      ),
    ),
    );
  }

Widget deliveryPoint({
  required BuildContext context,
  required String city,
  required String address,
  required String schedule,
}) {
  return Column(
    children: [
      Row(
        children: [
          Image.asset('assets/icons/ic_box.png', width: 38, height: 38),
          SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: AppStyles.getAppTextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    context: context,
                    fontFamily: 'poppins',
                    letterSpacing: 1
                  ),
                ),
                Text(
                  address,
                  style: AppStyles.getAppTextStyle(
                    color: Color(0xff686C68),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    context: context,
                    fontFamily: 'poppins',
                    letterSpacing: 1
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'График работы:',
                style: AppStyles.getAppTextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  context: context,
                  fontFamily: 'poppins',
                  letterSpacing: 1
                ),
              ),
              Text(
                schedule,
                style: AppStyles.getAppTextStyle(
                  color: Color(0xff686C68),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  context: context,
                  fontFamily: 'poppins',
                  letterSpacing: 1.5
                ),
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 12),
      Divider(color: Color(0xffC4C4C4), thickness: 2.5),
      SizedBox(height: 12),
    ],
  );
}


Widget review({
  required BuildContext context,
  required String name,
  required String text,
  required int stars,
  required String avatarLetter,
}) {
  return Expanded(
    child: Container(
      width: double.infinity,
      height: 110,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.01,
        right: MediaQuery.of(context).size.height * 0.01,
        top: MediaQuery.of(context).size.width * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xff355D3A),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xff355D3A),
                radius: 14,
                child: Text(
                  avatarLetter,
                  style: AppStyles.getAppTextStyle(
                    color: Color(0xffCCC68F),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    context: context,
                    fontFamily: 'poppins',
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                name,
                style: AppStyles.getAppTextStyle(
                  color: Color(0xff4B4B4C),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  context: context,
                  fontFamily: 'poppins',
                  letterSpacing: 1,
                ),
              ),
            ],
          ),

          SizedBox(height: 4),

          Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.getAppTextStyle(
              color: Color(0xff676764),
              fontSize: 10,
              fontWeight: FontWeight.w600,
              context: context,
              fontFamily: 'poppins',
              letterSpacing: 1,
            ),
          ),

          Spacer(), 

          if (stars > 0)
            Row(
              children: List.generate(stars, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Image.asset(
                    'assets/icons/ic_stars.png',
                    width: 20,
                    height: 20,
                  ),
                );
              }),
            ),
        ],
      ),
    ),
  );
}


}
