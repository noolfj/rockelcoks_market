import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const MyBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, 
      alignment: Alignment.topCenter,
      children: [
        BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF009688),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:  AppStyles.getAppTextStyle(
                color: const Color(0xff035D41),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                context: context,
                fontFamily: 'roboto',
              ), 
          unselectedLabelStyle:AppStyles.getAppTextStyle(
              color: const Color(0xff035D41),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              context: context,
              fontFamily: 'roboto',
            ),  
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/navbar/ic_home.png'), size: 35),   
              label: 'Дом',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/navbar/ic_category.png'), size: 35),        
              label: 'Категории',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/navbar/ic_chat.png'), size: 35),      
              label: 'Чат',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/navbar/ic_profile.png'), size: 35),       
              label: 'Профиль',
            ),
          ],
        ),
        Positioned(
          top: -25, 
          child: Container(
            width: 70, 
            height: 65,
           decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 0),   
                  spreadRadius: 1,        
                ),
              ],
            ),
            child: FloatingActionButton(
              onPressed: () {
                onItemTapped(2);
              },
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              elevation: 1, 
              child: ImageIcon(
                AssetImage('assets/icons/navbar/ic_shop.png'),
                color: selectedIndex == 2 ? Color(0xff035D41) : Colors.grey,
                size: 35, 
              ),        
            ),
          ),
        ),
      ],
    );
  }
}
