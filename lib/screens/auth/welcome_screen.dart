import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/auth/type_login_screen.dart';
import 'package:rockelcoks_market/utils/app_button_auth.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';
import 'package:rockelcoks_market/utils/custom_navigate_push.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showButtons = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => showButtons = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0F3B2E),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.2),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      'assets/icons/ic_logo.png',
                      height: 354,
                      width: 354,
                    ),
                    Positioned(
                      top: 5,
                      child: Text(
                        'WELCOME TO',
                        style: AppStyles.getAppTextStyle(
                          color: const Color(0xffCCC68F),
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          context: context,
                          fontFamily: 'nunito',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                SizedBox(
                  height: screenHeight * 0.2,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: showButtons ? 1.0 : 0.0,
                    child: showButtons
                        ? Column(
                            children: [
                               CustomButtonAuth(
                                text: 'Зарегистрироваться',
                                onPressed: () {},
                                backgroundColor: Color(0xFF9DA174),
                                textColor: Colors.white,
                                 padding: EdgeInsets.symmetric(
                                  vertical:MediaQuery.of(context).size.width * 0.03,
                                  horizontal:MediaQuery.of(context).size.height * 0.08,
                                ),
                                fontFamily: 'nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: screenHeight * 0.04),
                              CustomButtonAuth(
                                text: 'Войти в существующий',
                                onPressed: () {
                                customNavigatePushWithFade(context, TypeLoginScreen());
                                },
                                backgroundColor: Color(0xFF9DA174),
                                textColor: Colors.white,
                                 padding: EdgeInsets.symmetric(
                                  vertical:MediaQuery.of(context).size.width * 0.037,
                                  horizontal:MediaQuery.of(context).size.height * 0.088,
                                ),
                                fontFamily: 'ibmPlexSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
