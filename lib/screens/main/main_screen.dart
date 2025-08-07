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
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
    'assets/images/banner4.jpg',
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

  int _current = 0; 

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
                        Column(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 170,
                                enlargeCenterPage: true,
                                viewportFraction: 0.89,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
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
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: banners.asMap().entries.map((entry) {
                                return Container(
                                  width: 10,
                                  height: 10,
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == entry.key 
                                        ? Colors.red 
                                        : Colors.grey.withOpacity(0.6),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                         SizedBox(height: MediaQuery.of(context).size.height * 0.018),
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
                      _categoryItem('assets/icons/ic_shop.png','Оптовый\nзакуп'),
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
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration( 
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          top: BorderSide(
            color: Color(0xff6E6E6E), 
            width: 1, 
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 28, width: 32),
          SizedBox(height: 3),
          FittedBox(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: AppStyles.getAppTextStyle(
                color: const Color(0xff035D41),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                context: context,
                fontFamily: 'ibmPlexMono',
              ),
            ),
          ),
        ],
      ),
    );
  }

}