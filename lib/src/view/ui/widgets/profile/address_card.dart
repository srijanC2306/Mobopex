import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:flutter/material.dart';


class AddressCard extends StatelessWidget {
  final Map<String, String> address;

  AddressCard({required this.address});

  @override
  Widget build(BuildContext context) {
    bool isSelected = address['isSelected'] == 'true';

    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  address['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Implement edit action
                  },
                  child: Text('Edit' , style: BaseTextStyle(
                      color: ColorConstants.primaryColor,
                      fontSize: 14),),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              address['address']!,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                // TODO: Implement set as shipping address action
              },
              child: Row(
                children: [
                  Icon(
                    isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                    color:  ColorConstants.primaryColor ,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Use as Shipping address',
                    style: TextStyle(
                      color: isSelected ? ColorConstants.primaryColor: null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}