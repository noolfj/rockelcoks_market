import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/auth/confirmation_code_screen.dart';
import 'package:rockelcoks_market/screens/auth/welcome_screen.dart';
import 'package:rockelcoks_market/screens/home_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'Rockelcoks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(), 
      routes: {
        '/main_screen': (context) =>  HomeScreen(),
        '/welcome_screen': (context) =>  WelcomeScreen(),
        '/confirmation_code_screen': (context) =>  ConfirmationCodeScreen(),
      },
    );
  }
}