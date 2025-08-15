import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 104,
              left: 60,
              child: Opacity(
                opacity: 0.5,
                child: Transform.rotate(
                  angle: pi / 12,
                  child: Image.asset(
                    'assets/icons/ic_dollar_blue.png',
                    height: 47,
                    width: 53,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 122,
              right: 48,
              child: Opacity(
                opacity: 0.7,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Image.asset(
                    'assets/icons/ic_dollar_pink.png',
                    height: 42,
                    width: 55,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 122,
              right: -5,
              child: Opacity(
                opacity: 0.5,
                child: Transform.rotate(
                  angle: pi / 13,
                  child: Image.asset(
                    'assets/icons/ic_dollar_blue.png',
                    height: 47,
                    width: 53,
                  ),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --------------------------------- AppBar ---------------------------------
                Container(
                  height: 120,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        left: 20,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.black, size: 30),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 140,
                        child: Text(
                          'Мои Баллы',
                          style: AppStyles.getAppTextStyle(
                            color: const Color(0xFF035D41),
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            context: context,
                            fontFamily: 'ibmPlexSans',
                          ),
                        ),
                      ),
                      // --------------------------------- Доп. графика AppBar  ---------------------------------
                      Positioned(
                        top: 20,
                        right: -10,
                        child: Opacity(
                          opacity: 0.7,
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: Image.asset(
                              'assets/icons/ic_dollar_blue.png',
                              height: 76,
                              width: 66,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 47,
                        right: 90,
                        child: Opacity(
                          opacity: 0.5,
                          child: Transform.rotate(
                            angle: pi / 13,
                            child: Image.asset(
                              'assets/icons/ic_dollar_blue.png',
                              height: 47,
                              width: 53,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 95,
                        child: Opacity(
                          opacity: 0.7,
                          child: Transform.rotate(
                            angle: pi / 20,
                            child: Image.asset(
                              'assets/icons/ic_dollar_pink.png',
                              height: 47,
                              width: 53,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 55,
                        left: -5,
                        child: Opacity(
                          opacity: 0.5,
                          child: Transform.rotate(
                            angle: pi / -8,
                            child: Image.asset(
                              'assets/icons/ic_dollar_blue.png',
                              height: 47,
                              width: 53,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/ic_cyrcle.png',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 10),
                        Expanded( 
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Статистика переходов по',
                                style: AppStyles.getAppTextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  context: context,
                                  fontFamily: 'ibmPlexSans',
                                  lineHeight: 1.8,
                                ),
                              ),
                              Text(
                                'рефиральным ссылкам',
                                style: AppStyles.getAppTextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  context: context,
                                  fontFamily: 'ibmPlexSans',
                                  lineHeight: 1.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 60),

                // --------------------------------- Статистика месяца ---------------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'January, 2025',
                            style: AppStyles.getAppTextStyle(
                              color: const Color(0xff636363),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              context: context,
                              fontFamily: 'roboto',
                            ),
                          ),
                          Text(
                            'Активные Рефиралы',
                            style: AppStyles.getAppTextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontFamily: 'roboto',
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/ic_chart_98.png',
                        height: 40,
                        width: 80,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // --------------------------------- Диаграмма ---------------------------------
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: PointsPieChart(
                      greenPercent: 60,
                      greyPercent: 30,
                      whitePercent: 10,
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // --------------------------------- Список рефиралов ---------------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Row(
                    children: [
                      Text(
                        'Список рефиралов',
                        style: AppStyles.getAppTextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          context: context,
                          fontFamily: 'roboto',
                          lineHeight: 1.8,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/icons/ic_liner.png',
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
                // --------------------------------- Список Users с чатом  ---------------------------------
                Column(
                  children: [
                    TeamMemberItem(
                      name: 'Ralph Edwards',
                      role: 'Team Leader',
                      avatarAsset: 'assets/images/users/avatar1.png',
                    ),
                    const SizedBox(height: 16),
                    TeamMemberItem(
                      name: 'Jerome Bell',
                      role: 'Marketing Coordinator',
                      avatarAsset: 'assets/images/users/avatar2.png',
                    ),
                    const SizedBox(height: 16),
                    TeamMemberItem(
                      name: 'Robert Fox',
                      role: 'Software Developer',
                      avatarAsset: 'assets/images/users/avatar3.png',
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                 // --------------------------------- Кешбек за покупку ---------------------------------

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Text(
                      'Кешбек за покупки от \n200сомони',
                      style: AppStyles.getAppTextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        context: context,
                        fontFamily: 'ibmplexsans',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/users/avatar4.png'),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Arthur',
                          style: AppStyles.getAppTextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            context: context,
                            fontFamily: 'roboto',
                            lineHeight: 1.8,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '+23.45%',
                          style: AppStyles.getAppTextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            context: context,
                            fontFamily: 'roboto',
                            lineHeight: 1.8,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30), 

                    Text(
                      'Май',
                      style: AppStyles.getAppTextStyle(
                        color: Color(0xff373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        context: context,
                        fontFamily: 'roboto',
                        lineHeight: 2,
                        letterSpacing: -0.2,
                      ),
                    ),
                     const SizedBox(height: 8), 
                    Text(
                      'Баллы: 9834.72',
                      style: AppStyles.getAppTextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        context: context,
                        fontFamily: 'roboto',
                      ),
                    ),
                     const SizedBox(height: 8), 
                    Text(
                      'вывод на карту можно осуществить после достижения 1000 сомони в кешбеках ',
                      style: AppStyles.getAppTextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        context: context,
                        fontFamily: 'roboto',
                        lineHeight: 1.8,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 16), 
                    
                  ],
                ),
              ),
               Image.asset(
                  'assets/icons/ic_chart_up.png', 
                  width: double.infinity,
                  height: 200, 
                  fit: BoxFit.contain,
                ),


                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      Text(
                        'На что вы можете потратить баллы',
                        style: AppStyles.getAppTextStyle(
                          color: Color(0xff035D41),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          context: context,
                          fontFamily: 'ibmplexsans',
                          letterSpacing: 1
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
               const SizedBox(height: 30), 

                 Padding(
                padding: EdgeInsets.only(left: 30), 
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Image.asset(
                            'assets/icons/ic_dollar_blue.png',
                            height: 23,
                            width: 23,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Обменяйте баллы на подарки',
                            style: AppStyles.getAppTextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              context: context,
                              fontFamily: 'roboto',
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Image.asset(
                            'assets/icons/ic_dollar_blue.png',
                            height: 23,
                            width: 23,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Откройте эксклюзивные функции',
                            style: AppStyles.getAppTextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              context: context,
                              fontFamily: 'roboto',
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Image.asset(
                            'assets/icons/ic_dollar_blue.png',
                            height: 23,
                            width: 23,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Получите скидку на покупку - \n10 баллов = 1 сомони',
                            style: AppStyles.getAppTextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              context: context,
                              fontFamily: 'roboto',
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), 

                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/ic_chart_line.png',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'История',
                            style: AppStyles.getAppTextStyle(
                              color: Color(0xff035D41),
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              context: context,
                              fontFamily: 'roboto',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4), 

                      Text(
                        'Баллы использованные в майе',
                        style: AppStyles.getAppTextStyle(
                          color: Color(0xff383838),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          context: context,
                          fontFamily: 'roboto',
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                 const SizedBox(height: 20), 

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                       Image.asset(
                            'assets/images/chart_line.png',
                            height: 242,
                            width: 360,
                          ),
                    ],
                  ),
                ),

              const SizedBox(height: 20), 

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                       Image.asset(
                            'assets/images/chart_up.png',
                            height: 295,
                            width: 360,
                          ),
                    ],
                  ),
                ),

              const SizedBox(height: 20), 

              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Container(
                       width: 175, 
                       height: 50,
                       decoration: BoxDecoration(
                         color: Color(0xFFF0F0F0),
                         borderRadius: BorderRadius.circular(8),
                         border: Border.all(color: Color(0xFFD0D0D0), width: 1),
                       ),
                       child: Center(
                         child: Text(
                           '6000см',
                           style: AppStyles.getAppTextStyle(
                             color: Colors.black,
                             fontSize: 20,
                             fontWeight: FontWeight.w600,
                             context: context,
                             fontFamily: 'roboto',
                           ),
                         ),
                       ),
                     ),

                     const SizedBox(width: 12), 

                     ElevatedButton(
                       onPressed: () {},
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color(0xff355D3A),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8),
                         ),
                         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                       ),
                       child: Text(
                         'вывод',
                         style: AppStyles.getAppTextStyle(
                           color: Colors.white,
                           fontSize: 22,
                           fontWeight: FontWeight.w600,
                           context: context,
                           fontFamily: 'roboto',
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
              const SizedBox(height: 20), 


              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------Class Диаграмма Cyrcle  ---------------------------------
class PointsPieChart extends StatelessWidget {
  final double greenPercent;
  final double greyPercent;
  final double whitePercent;

  const PointsPieChart({
    super.key,
    required this.greenPercent,
    required this.greyPercent,
    required this.whitePercent,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: greenPercent,
            color: const Color(0xFF035D41),
            radius: 100,
            showTitle: false,
          ),
          PieChartSectionData(
            value: greyPercent,
            color: const Color(0xFFE9E9E9),
            radius: 100,
            showTitle: false,
          ),
          PieChartSectionData(
            value: whitePercent,
            color: Colors.white,
            radius: 100,
            showTitle: false,
          ),
        ],
        centerSpaceRadius: 0,
        startDegreeOffset: 90,
      ),
    );
  }
}

// ---------------------------------Class Списко Юзеров с чатом  ---------------------------------
class TeamMemberItem extends StatelessWidget {
  final String name;
  final String role;
  final String avatarAsset;

  const TeamMemberItem({
    Key? key,
    required this.name,
    required this.role,
    required this.avatarAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(avatarAsset),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppStyles.getAppTextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    context: context,
                    fontFamily: 'roboto',
                  ),
                ),
                Text(
                  role,
                  style: AppStyles.getAppTextStyle(
                    color: Color(0xffA0A0A0),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    context: context,
                    fontFamily: 'roboto',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/icons/ic_message.png',
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }
}
