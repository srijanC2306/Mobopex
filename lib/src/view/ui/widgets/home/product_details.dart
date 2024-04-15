import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String productName;
  final String productType;
  final String productColor;
  final String specifications;
  final String manufacturer;

  ProductDetails({
    required this.productName,
    required this.productType,
    required this.productColor,
    required this.specifications,
    required this.manufacturer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0), // Adjust padding as needed
      color: Colors.white, // Background color for the details section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DetailRow(heading: 'Product Name:', data: productName),
          DetailRow(heading: 'Product Type:', data: productType),
          DetailRow(heading: 'Product Color:', data: productColor),
          DetailRow(heading: 'Specifications:', data: specifications),
          DetailRow(heading: 'Manufactured by:', data: manufacturer),
          // Include any other details in a similar fashion
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String heading;
  final String data;

  DetailRow({required this.heading, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0), // Space between rows
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2, // takes 2 parts of the row (40%)
            child: Text(
              heading,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16, // Adjust the font size as needed
              ),
            ),
          ),
          Expanded(
            flex: 3, // takes 3 parts of the row (60%)
            child: Text(
              data,
              style: TextStyle(
                fontSize: 16, // Adjust the font size as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
