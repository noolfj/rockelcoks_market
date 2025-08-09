import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/category/category_screen.dart';
import 'package:rockelcoks_market/screens/chat/chat_screen.dart';
import 'package:rockelcoks_market/screens/main/main_screen.dart';
import 'package:rockelcoks_market/screens/navbar.dart.dart';
import 'package:rockelcoks_market/screens/profile/profile_screen.dart';
import 'package:rockelcoks_market/screens/shop/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MainScreen(),
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
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
