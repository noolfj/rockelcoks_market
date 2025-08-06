import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rockelcoks_market/screens/main/search_textfield.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> banners = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  final List<String> popularSearches = [
    'Кроссовки',
    'Кондиционер',
    'Компьютер',
    'Кошка',
  ];

  final List<String> recommendedSearches = [
    'Ноутбук',
    'Бизнес товары',
    'Оптовые товары',
    'Одежда',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xffDFE0DF),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/bg_appbar.png',
                      fit: BoxFit.cover,
                      height: 350,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 24),
                        AppBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          title: Row(
                            children: [
                              Image.asset(
                                'assets/icons/ic_logo_appbar.png',
                                height: 46,
                                width: 46,
                              ),
                              ShaderMask(
                                shaderCallback: (bounds) {
                                  return const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.black,
                                      Colors.white,
                                    ],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.srcIn,
                                child: Text(
                                  'ROCKELCOKS',
                                  style: AppStyles.getAppTextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    context: context,
                                    fontFamily: 'ibmPlexSans',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/icons/ic_address.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                                Text(
                                  'Адрес',
                                  style: AppStyles.getAppTextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    context: context,
                                    fontFamily: 'nunito',
                                  ),
                                ),
                                const SizedBox(width: 30),
                              ],
                            ),
                          ],
                        ),
                         SizedBox(
                          height: MediaQuery.of(context).size.height * 0.066,
                         ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 170,
                            enlargeCenterPage: true,
                            viewportFraction: 0.89,
                            autoPlay: true,
                          ),
                          items: banners
                              .map(
                                (img) => ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    img,
                                    fit: BoxFit.cover,
                                    width: 1000,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _categoryItem('assets/icons/ic_link.png', 'Ссылка'),
                      _categoryItem('assets/icons/ic_points.png', 'Баллы'),
                      _categoryItem('assets/icons/ic_shop.png',
                          'Оптовый\nзакуп'),
                      _categoryItem('assets/icons/ic_biz.png', 'Бизнес'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        Positioned(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 25,
          left: 0,
          right: 0,
          child: SearchField(
            popularSearches: popularSearches,
            recommendedSearches: recommendedSearches,
            onSelected: (value) {
              print('Выбрано: $value');
            },
          ),
        ),
      ],
      ),
    );
  }

  Widget _categoryItem(String icon, String label) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 24),
          const SizedBox(height: 3),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
