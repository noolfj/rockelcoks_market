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
                        left: 16,
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
                  padding: const EdgeInsets.symmetric(horizontal: 65),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/ic_cyrcle.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 10),
                      Column(
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

                const SizedBox(height: 60),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
