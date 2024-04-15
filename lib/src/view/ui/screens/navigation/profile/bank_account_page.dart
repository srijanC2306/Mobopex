import 'package:MoboPex/src/view/ui/widgets/profile/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../base_stateless_widget.dart';
import '../../../../resources/color_constants.dart';


class BankAccountsPage extends StatelessWidget {
  final  GlobalKey<NavigatorState> navKey  ;
  const BankAccountsPage({required this.navKey});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Accounts', style: BaseTextStyle(
            color: ColorConstants.primaryColor ,
            fontSize: 24  ,
            fontWeight: FontWeight.w700
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CreditCardWidget(
            cardNumber: '**** **** **** 4567',
            cardHolderName: 'John Doe',
            expiryDate: '12/26',
            cardType: 'mastercard', // mastercard, visa, etc.
            isDefault: true,
          ),
          CreditCardWidget(
            cardNumber: '**** **** **** 4807',
            cardHolderName: 'Jane Doe',
            expiryDate: '11/24',
            cardType: 'visa',
            isDefault: false,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Handle 'Add Bank Account' button press
            },
            child: Text('Add Bank Account'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cardType;
  final bool isDefault;

  CreditCardWidget({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    required this.isDefault,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Color(0x1A000000), offset: Offset(0, 1), blurRadius: 2),
          BoxShadow(color: Color(0x17000000), offset: Offset(0, 4), blurRadius: 4),
          BoxShadow(color: Color(0x0D000000), offset: Offset(0, 9), blurRadius: 5),
          BoxShadow(color: Color(0x03000000), offset: Offset(0, 15), blurRadius: 6),
          BoxShadow(color: Color(0x00000000), offset: Offset(0, 24), blurRadius: 7),
        ],
     //   color: Color(0xFF1F1F1F),
        gradient: LinearGradient(
          colors: [Color(0xFFFC9DA0).withOpacity(0.8), Color(0xFF7C1E21).withOpacity(0.2)], // Replace with actual gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Replace with actual card type icon
              Icon(Icons.credit_card, color: Colors.white),
              Text(
                cardNumber,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Card Holder Name',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            cardHolderName,
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Expiry',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            expiryDate,
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isDefault,
                onChanged: (bool? value) {
                  // Handle checkbox change
                },
              ),
              Text(
                'Use as default payment method',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
