import 'package:json_annotation/json_annotation.dart';

part 'product_details.g.dart';

@JsonSerializable()
class ProductDetails {
  final String productName;

  final String description;

  final String imageUrl ;
  final String priceFallInPercentage;

  final String actualPrice;

  ProductDetails({
    required this.productName,
    required this.description,
    required this.imageUrl ,
    required this.priceFallInPercentage,
    required this.actualPrice,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);


  static List<ProductDetails> listFromJson( List<dynamic> json){
    return json.map((productJson) => ProductDetails.fromJson(productJson)).toList() ;
  }
}


