import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class MicroScreen extends StatefulWidget {
  @override
  _MicroScreenState createState() => _MicroScreenState();
}

class _MicroScreenState extends State<MicroScreen> with SingleTickerProviderStateMixin {
  bool _isListening = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onMicPressed() {
    setState(() {
      _isListening = !_isListening;
      if (_isListening) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ringColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.red,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Назад'),
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/ic_left.png',
            width: 10,
            height: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(
              'Нажмите и скажите что вы хотите найти',
              textAlign: TextAlign.center, 
              style: AppStyles.getAppTextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w600,
                context: context,
                fontFamily: 'roboto',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: _onMicPressed,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return  Stack(
                      alignment: Alignment.center,
                      children: [
                        if (_isListening)
                          Transform.rotate(
                            angle: _controller.value * 2 * 3.14159,
                            child: CustomPaint(
                              size: Size(170, 170),
                              painter: RingPainter(ringColors),
                            ),
                          ),
                       Container(
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey[300],
                            child: Image.asset(
                              _isListening
                                  ? 'assets/icons/ic_micro_on.png'
                                  : 'assets/icons/ic_micro_off.png',
                              width: 160,
                              height: 160,
                            ),
                          ),
                        ),

                      ],
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  final List<Color> colors;

  RingPainter(this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radiusOuter = size.width / 2;
    final radiusInner = radiusOuter - 10;

    final rect = Rect.fromCircle(center: center, radius: radiusOuter);

    final sweepGradient = SweepGradient(
      colors: colors,
      startAngle: 0.0,
      endAngle: 3.14159 * 2,
      tileMode: TileMode.clamp,
    );

    final paint = Paint()
      ..shader = sweepGradient.createShader(rect)
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawCircle(center, radiusOuter, paint);

    final innerPaint = Paint()
      ..color = Colors.grey[300]! 
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radiusInner, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
