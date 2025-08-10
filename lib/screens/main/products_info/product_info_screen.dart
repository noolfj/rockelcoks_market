import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/category/category_screen.dart';
import 'package:rockelcoks_market/screens/chat/chat_screen.dart';
import 'package:rockelcoks_market/screens/navbar.dart.dart';
import 'package:rockelcoks_market/screens/profile/profile_screen.dart';
import 'package:rockelcoks_market/screens/shop/shop_screen.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';


class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  int selectedTab = 0;
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Container(), 
    CategoryScreen(),
    ShopScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _screens[0] = _buildProductInfoScreen();
    return Scaffold(
      backgroundColor: const Color(0xffDFE0DF),
      body: _screens[_selectedIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildProductInfoScreen() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'О товаре',
                      style: AppStyles.getAppTextStyle(
                        context: context,
                        color: const Color(0xff333331),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'nunito',
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/ic_close.png',
                        height: 12,
                        width: 12,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildTabButton("Характеристики", 0),
                        const SizedBox(width: 8),
                        _buildTabButton("Описание", 1),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(0, 10),
                      child: _buildTabButton("✅ Документы проверены", 2, small: true),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (selectedTab == 0) _buildCharacteristics(),
              if (selectedTab == 1) _buildDescription(),
              if (selectedTab == 2) _buildDocuments(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index, {bool small = false}) {
    final bool isSelected = selectedTab == index;
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedTab = index;
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
        backgroundColor:
            isSelected ? const Color(0xff8BBCA6) : const Color(0xffC2C2C2),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: small ? 4 : 6),
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xff035D41) : Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: 'agdasima',
        ),
      ),
    );
  }

  Widget _buildCharacteristics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              style: AppStyles.getAppTextStyle(
                context: context,
                color: const Color(0xff676764), 
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'workSans',
              ),
              children: [
                const TextSpan(text: 'Артикул: '),
                TextSpan(
                  text: '(Уникальный номер, Опционально)',
                  style: TextStyle(
                  color: const Color(0xff035D41), 
                  ),
                ),
              ],
            ),
          ),
        ),

        _titleText("Основная информация"),
        _infoText("Цвет:", "Чёрный, Белый, Хаки"),
        const SizedBox(height: 8),
        _titleText("Общие характеристики"),
        _infoText("Фасон:", "унисекс"),
        _infoText("Материал:", "100% хлопок"),
        _infoText("Особенности:", "плотная ткань, не просвечивает"),
        const SizedBox(height: 8),
        _titleText("Дополнительная информация"),
        _infoText("Размеры:", "S–3XL"),
        const SizedBox(height: 16),
        ClipRRect(
          child: SizedBox(
            width: double.infinity,
            height: 370,
            child: Image.asset(
              'assets/images/products/shirt.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Универсальная футболка для повседневного и кэжуал стиля, отличающаяся комфортом и качеством ткани – идеальный выбор для тех, кто ценит удобство и модный внешний вид.",
            style: AppStyles.getAppTextStyle(
              context: context,
              color: const Color(0xff676764),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'workSans',
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _titleText(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: AppStyles.getAppTextStyle(
          context: context,
          color: const Color(0xff333331),
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: 'agdasima',
        ),
      ),
    );
  }

  Widget _infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: AppStyles.getAppTextStyle(
                context: context,
                color: const Color(0xff676764),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'workSans',
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppStyles.getAppTextStyle(
                context: context,
                color: const Color(0xff676764),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'workSans',
              ),
            ),
          ),
        ],
      ),
    );
  }

    Widget _buildDescription() {
    return Row(
      children: [
      SizedBox(height: 100),

        Container(
          child: const Text(
            "  Описание товара",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildDocuments() {
    return Row(
      children: [
      SizedBox(height: 100),

        Container(
          child: const Text(
            "  Документы",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}