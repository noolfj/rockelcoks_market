import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';
import 'package:rockelcoks_market/utils/custom_Snackbar.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({Key? key}) : super(key: key);

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _buttonAnimation;
  late Animation<Offset> _codeAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    
    _buttonAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuart,
      ),
    );
    
    _codeAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 1.0, curve: Curves.easeOutQuart),
      ),
    );
    
    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/bg_referral.png',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        AppBar(
                          elevation: 0,
                          scrolledUnderElevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    )
                  ],
                ),
                Transform.translate(
                  offset: const Offset(0, -0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'С друзьями выгоднее',
                                  style: AppStyles.getAppTextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                    context: context,
                                    fontFamily: 'roboto',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Друзьям 30 дней подписки в подарок,\nа вам 10 с за каждого покупки\nдруга свыше 200см',
                                  style: AppStyles.getAppTextStyle(
                                    color: const Color(0xff6D6D6D),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    context: context,
                                    fontFamily: 'roboto',
                                    lineHeight: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          FadeTransition(
                            opacity: _opacityAnimation,
                            child: SlideTransition(
                              position: _buttonAnimation,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 56,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff355D3A),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                        ),
                                        child: Text(
                                          'Поделиться промокодом',
                                          style: AppStyles.getAppTextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            context: context,
                                            fontFamily: 'roboto',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    SlideTransition(
                                      position: _codeAnimation,
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 56,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Clipboard.setData(const ClipboardData(text: '453134241d35'));
                                            showCustomSnackBar(
                                              context,
                                              'Скопировано',
                                              Colors.green,
                                            );
                                          },
                                          style: OutlinedButton.styleFrom(
                                            side: const BorderSide(color: Color(0xff355D3A), width: 2),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    '453134241d35',
                                                    style: AppStyles.getAppTextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.w600,
                                                      context: context,
                                                      fontFamily: 'roboto',
                                                      lineHeight: 1.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Image.asset(
                                                'assets/icons/ic_copy.png',
                                                height: 20,
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    SlideTransition(
                                      position: _codeAnimation,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xffE6E6E6),
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                           Column(
                                              children: [
                                                Text(
                                                  '0',
                                                  style: AppStyles.getAppTextStyle(
                                                    color: Colors.black,
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.w500,
                                                    context: context,
                                                    fontFamily: 'roboto',
                                                    lineHeight: 1.5,
                                                  ),
                                                  textAlign: TextAlign.center, 
                                                ),
                                                Text(
                                                  'Активаций \nпромокода',
                                                  style: AppStyles.getAppTextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    context: context,
                                                    fontFamily: 'roboto',
                                                    lineHeight: 1.5,
                                                  ),
                                                  textAlign: TextAlign.center, 
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  '0',
                                                  style: AppStyles.getAppTextStyle(
                                                    color: Colors.black,
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.w500,
                                                    context: context,
                                                    fontFamily: 'roboto',
                                                    lineHeight: 1.5,
                                                  ),
                                                  textAlign: TextAlign.center, 
                                                ),
                                                Text(
                                                  'Продлений \nподписки',
                                                  style: AppStyles.getAppTextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    context: context,
                                                    fontFamily: 'roboto',
                                                    lineHeight: 1.5,
                                                  ),
                                                  textAlign: TextAlign.center, 
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/ic_question.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 8), 
                                Text(
                                  'Как это работает',
                                  style: AppStyles.getAppTextStyle(
                                    color: const Color(0xff6D6D6D),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    context: context,
                                    fontFamily: 'roboto',
                                    lineHeight: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),

                          Column(
                            children: [
                              StepWidget(
                                text: '1. Получите свою реферальную ссылку',
                                nextText: 'Текст текст текст...',
                              ),
                              StepWidget(
                                text: '2. Пригласите друзей',
                                nextText: 'Поделитесь ссылкой с друзьями в мессенджерах, соцсетях или где угодно',
                              ),
                              StepWidget(
                                text: '3. Друзья регистрируются',
                                nextText: 'Текст текст текст...',
                              ),
                              StepWidget(
                                text: '4. Вы получаете бонусы',
                                nextText: 'Текст текст текст...',
                              ),
                              StepWidget(
                                text: '5. Следите за результатами',
                                nextText: 'Текст текст текст...',
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StepWidget extends StatefulWidget {
  final String text;
  final String nextText;

  const StepWidget({super.key, required this.text, required this.nextText});

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 8,top: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text,
                        style: AppStyles.getAppTextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          context: context,
                          fontFamily: 'roboto',
                          lineHeight: 1.2,
                        ),
                      ),
                      if (!_isExpanded)
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Divider(
                            color: Color(0xff505050),
                            thickness: 0.5,
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.nextText,
              style: AppStyles.getAppTextStyle(
                color: const Color(0xff6D6D6D),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                context: context,
                fontFamily: 'roboto',
                lineHeight: 1.2,
              ),
            ),
          ),
      ],
    );
  }
}