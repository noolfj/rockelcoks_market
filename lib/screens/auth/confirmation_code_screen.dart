import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/home_screen.dart';
import 'package:rockelcoks_market/screens/main/main_screen.dart';
import 'package:rockelcoks_market/utils/app_button_auth.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  bool _isVisible = true; 

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double containerWidth = screenWidth * 0.80;
    double containerHeight = screenHeight * 0.47;

    Widget _buildOtpField(BuildContext context) {
      return Container(
        width: screenWidth * 0.095,
        height: screenHeight * 0.083,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(45),
        ),
        child: TextField(
          cursorWidth: 1.5,
          cursorHeight: screenHeight * 0.04,
          cursorColor: Colors.black,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: AppStyles.getAppTextStyle(
            color: Colors.black,
            fontSize: 64,
            fontWeight: FontWeight.w700,
            context: context,
            fontFamily: 'afacad',
          ),
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: screenHeight * 0.018),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      );
    }

    void _showBlurDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,  
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            content: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.46,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Добро пожаловать!',
                      style: AppStyles.getAppTextStyle(
                        color: const Color(0xff171616),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        context: context,
                        fontFamily: 'afacad',
                      ),
                    ),
                    SizedBox(height: 100),
                    Text(
                      'Вы успешно вошли в аккаунт с \nпомощью номера телефона',
                      style: AppStyles.getAppTextStyle(
                        color: const Color(0xff716767),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        context: context,
                        fontFamily: 'afacad',
                      ),
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: CustomButtonAuth(
                        text: 'Продолжить',
                        onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                        },
                        backgroundColor: const Color(0xFF035D41),
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: MediaQuery.of(context).size.width * 0.15,
                        ),
                        fontFamily: 'agdasima',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}


    return Scaffold(
      backgroundColor: Color(0xffDAE0DA),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: containerWidth,
                height: containerHeight,
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.015),

                    if (_isVisible) ...[
                      Text(
                        'Подтверждения',
                        style: AppStyles.getAppTextStyle(
                          color: const Color(0xff171616),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          context: context,
                          fontFamily: 'afacad',
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.07),

                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Введите код который был \n отправлен на ваш номер',
                            style: AppStyles.getAppTextStyle(
                              color: const Color(0xff716767),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              context: context,
                              fontFamily: 'afacad',
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.005),

                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(3, (_) => _buildOtpField(context)),
                            SizedBox(width: screenWidth * 0.04),
                            ...List.generate(3, (_) => _buildOtpField(context)),
                          ],
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.04),

                      CustomButtonAuth(
                        text: 'Подтвердить',
                        onPressed: () {
                          setState(() {
                            _isVisible = false;
                          });

                          _showBlurDialog(context);

                        },
                        backgroundColor: const Color(0xFF035D41),
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.035,
                          horizontal: screenWidth * 0.20,
                        ),
                        fontFamily: 'agdasima',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
