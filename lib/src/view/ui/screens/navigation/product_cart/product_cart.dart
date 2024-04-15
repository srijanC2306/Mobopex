import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/asset_constants.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:MoboPex/src/view/ui/widgets/navigator/base_navigator.dart';
import 'package:flutter/cupertino.dart';

class ProductCartPage extends StatelessWidget {
  const ProductCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseNavigator(
      builder: (navKey) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              navKey.currentState?.pop();
            },
          ),
          title: Text('My Cart', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            CartItem(
              productName: 'Product X',
              productPrice: 300,
              productImage: AssetConstants.airpodsPicture,
              quantity: 1,
            ),
            CartItem(
              productName: 'Product Y',
              productPrice: 400,
              productImage: AssetConstants.iphonePLaceHolder,
              quantity: 2,
            ),
            CartItem(
              productName: 'Product Z',
              productPrice: 500,
              productImage: AssetConstants.phonePLaceHolder,
              quantity: 1,
            ),
            CheckoutSection(),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final String productName;
  final int productPrice;
  final String productImage;
  final int quantity;

  CartItem({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.quantity,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Checkbox(
              value: true,
              activeColor: ColorConstants.primaryColor,
              onChanged: (bool? newValue) {},
            ),
            const SizedBox(width: 4.0,),
            Image.asset(widget.productImage, width: 120, height:120 ),
            // Replace with NetworkImage if needed
            const SizedBox(width: 16.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(widget.productName, style: TextStyle(fontSize: 18)),
                  Text('Full Product name',
                      style: TextStyle(color: Colors.grey)),
                  Text('₹ ${widget.productPrice}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  QuantityButton(quantity: widget.quantity),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class QuantityButton extends StatefulWidget {
  final int quantity;

  QuantityButton({required this.quantity});

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
            icon: Icon(CupertinoIcons.minus_rectangle, color: ColorConstants.primaryColor),
            onPressed: () {}),
        Text('${widget.quantity}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        IconButton(
            icon: Icon(Icons.add_box_outlined , color: ColorConstants.primaryColor,),
            onPressed: () {
            }
        ),
      Spacer(),
        IconButton(
            icon: Icon(CupertinoIcons.trash, color: ColorConstants.primaryColor),
            onPressed: () {}),
      ],
    );
  }
}

class CheckoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Select All', style: TextStyle(fontSize: 18)),
                Checkbox(
                  value: true,
                  onChanged: (bool? newValue) {},
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total Payment',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('₹ 300',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.primaryColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text('Checkout',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
