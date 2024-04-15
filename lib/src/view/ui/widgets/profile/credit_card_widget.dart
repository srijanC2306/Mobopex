import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreditCardView(),
    );
  }
}

class CreditCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: CreditCardWidget(
          cardNumber: '**** **** **** 4567',
          cardHolderName: 'John Doe',
          expiryDate: '12/26',
          isDefault: true,
        ),
      ),
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final bool isDefault;

  const CreditCardWidget({
    Key? key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    this.isDefault = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 222,
      decoration: BoxDecoration(
        color: Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(16),
        boxShadow: kElevationToShadow[2],
      ),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(380, 222),
            painter: BorderGradientPainter(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardTopRow(cardNumber: cardNumber),
                CardBottomRow(
                  cardHolderName: cardHolderName,
                  expiryDate: expiryDate,
                  isDefault: isDefault,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardTopRow extends StatelessWidget {
  final String cardNumber;

  const CardTopRow({Key? key, required this.cardNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/chip.png', width: 40), // Replace with your asset
        Text(cardNumber, style: TextStyle(color: Colors.white, fontSize: 24)),
        Image.asset('assets/mastercard.png', width: 40), // Replace with your asset
      ],
    );
  }
}

class CardBottomRow extends StatelessWidget {
  final String cardHolderName;
  final String expiryDate;
  final bool isDefault;

  const CardBottomRow({Key? key, required this.cardHolderName, required this.expiryDate, required this.isDefault})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card Holder Name',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Text(
              cardHolderName,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 4),
            Text(
              'Expiry',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Text(
              expiryDate,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        isDefault
            ? Icon(Icons.check_circle_outline, color: Colors.green)
            : SizedBox.shrink(),
      ],
    );
  }
}

class BorderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromRGBO(252, 157, 160, 0.8),
        Color.fromRGBO(124, 30, 33, 0.288),
      ],
      stops: [0.183, 1.1014],
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(16));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
