import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:MoboPex/src/view/ui/widgets/profile/address_card.dart';
import 'package:flutter/material.dart';

class ShippingAddressPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navKey ;
  final bool hasAddress;

  ShippingAddressPage({required this.hasAddress , required this.navKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Shipping Address' , style: BaseTextStyle(
          color: ColorConstants.primaryColor ,
          fontSize: 24  ,
          fontWeight: FontWeight.w700
        ),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back) , onPressed: (){
          navKey.currentState?.pop();
        },),
      ),
      body: hasAddress ? buildAddressList() : buildAddNewAddress(),
    );
  }
  Widget buildAddNewAddress() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Navigate to address addition form
          },
          child: Text('Add New Address'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }

  // ... previous code

  Widget buildAddressList() {
    // Dummy list of addresses
    List<Map<String, String>> addresses = [
      {
        'name': 'Jane Doe',
        'address': '5678 Oak Avenue, Springfield, IL 62701, USA',
        'isSelected': 'true' // To indicate which address is selected
      },
      {
        'name': 'John Doe',
        'address': '1234 Pine Street, Sunnyvale, CA 94086, USA',
        'isSelected': 'false'
      },
      {
        'name': 'Jane Doe',
        'address': '123 Main Street, Suite 200, Cityville, NY 10001, USA',
        'isSelected': 'false'
      },
    ];

    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        bool isSelected = addresses[index]['isSelected'] == 'true';
        return AddressCard(address: addresses[index],);
      },
    );
  }

// ... previous code

}