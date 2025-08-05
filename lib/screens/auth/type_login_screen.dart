import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/auth/login_screen.dart';
import 'package:rockelcoks_market/utils/app_button_auth.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class TypeLoginScreen extends StatelessWidget {
  const TypeLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double containerWidth = screenWidth * 0.80; 
    double containerHeight = screenHeight * 0.47; 

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bg_top.png',
                fit: BoxFit.fill,
                height: screenHeight * 0.33,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bg_bottom.png',
                fit: BoxFit.fill,
                height: screenHeight * 0.33,
              ),
            ),
            Center(
              child: Container(
                width: containerWidth,
                height: containerHeight,
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: const Color(0xff355D3A), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(height: screenHeight * 0.06),
                    
                    Text(
                      'Выберите способ входа',
                      style: AppStyles.getAppTextStyle(
                        color: const Color(0xff355D3A),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        context: context,
                        fontFamily: 'nunito',
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.06),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Вход в сущeствующий \nАккаунт',
                        textAlign: TextAlign.center,
                        style: AppStyles.getAppTextStyle(
                          color: const Color(0xffBDCEBC),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          context: context,
                          fontFamily: 'ibmPlexSans',
                        ),
                      ),
                    ),


                    SizedBox(height: screenHeight * 0.03),

                    CustomButtonAuth(
                      text: 'Номер телефона',
                      onPressed: () { },
                      backgroundColor: const Color(0xFF035D41),
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.035,
                        horizontal: screenWidth * 0.20,
                      ),
                      fontFamily: 'ibmPlexSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(height: screenHeight * 0.07),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'При продолжении авторизации вы соглашайтесь на обработку ваших персональных данных.',
                                  textAlign: TextAlign.left,
                                  style: AppStyles.getAppTextStyle(
                                    color: const Color(0xFF035D41),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    context: context,
                                    fontFamily: 'ibmPlexSans',
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Text(
                                  'Политика конфиденциальности',
                                  textAlign: TextAlign.left,
                                  style: AppStyles.getAppTextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    context: context,
                                    fontFamily: 'ibmPlexSans',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.01),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Назад',
                              style: AppStyles.getAppTextStyle(
                                color: const Color(0xFF035D41),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                context: context,
                                fontFamily: 'ibmPlexSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
