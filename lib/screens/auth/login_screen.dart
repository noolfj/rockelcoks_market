import 'package:flutter/material.dart';
import 'package:rockelcoks_market/screens/auth/confirmation_code_screen.dart';
import 'package:rockelcoks_market/utils/app_button_auth.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double containerWidth = screenWidth * 0.80; 
    double containerHeight = screenHeight * 0.47; 

    return Scaffold(
      backgroundColor: Color(0xffDAE0DA),
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
                  border: Border.all(color:  Colors.white, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(height: screenHeight * 0.015),
                    
                    Text(
                      'Войти',
                      style: AppStyles.getAppTextStyle(
                        color: const Color(0xff355D3A),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        context: context,
                        fontFamily: 'afacad',
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015),

                 Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Телефон',
                            style: AppStyles.getAppTextStyle(
                              color: const Color(0xff121212),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              context: context,
                              fontFamily: 'inter',
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric( horizontal: 20),
                            constraints: BoxConstraints(maxHeight: 42),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide(color: Color(0xff355D3A), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide(color: Color(0xff355D3A), width: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                   SizedBox(height: screenHeight * 0.01),

                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Пароль',
                            style: AppStyles.getAppTextStyle(
                              color: const Color(0xff121212),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              context: context,
                              fontFamily: 'inter',
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            constraints: BoxConstraints(maxHeight: 42),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide(color: Color(0xff355D3A), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide(color: Color(0xff355D3A), width: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                    SizedBox(height: screenHeight * 0.03),

                   CustomButtonAuth(
                      text: 'Продолжить',
                      onPressed: () {
                          Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => ConfirmationCodeScreen()),
                         );
                        // _showLoadingAndNavigate(context);
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

                    SizedBox(height: screenHeight * 0.01),

                    Text(
                      'Забыли пароль ?',
                      textAlign: TextAlign.center,
                      style: AppStyles.getAppTextStyle(
                        color: Color(0xff716767),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        context: context,
                        fontFamily: 'afacad',
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

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

//   void _showLoadingAndNavigate(BuildContext context) async {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) => Dialog(
//       backgroundColor: Colors.transparent,
//       child: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircularProgressIndicator(
//               color: Color(0xFF035D41),
//             ),
//             SizedBox(height: 15),
//             Text(
//               'Проверка данных...',
//               style: TextStyle(
//                 color: Color(0xFF035D41),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );

//   await Future.delayed(Duration(seconds: 2));

//   Navigator.of(context).pop();

//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => ConfirmationCodeScreen()),
//   );
// }

}
