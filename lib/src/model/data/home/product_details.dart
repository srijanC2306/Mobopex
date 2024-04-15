import 'package:json_annotation/json_annotation.dart';

part 'product_details.g.dart';

@JsonSerializable()
class ProductDetails {
  final String productName;

  final String description;

  final List<String> imageUrls ;
  final String priceFallInPercentage;

  final String productType ;

  final String productColor ;



  final String actualPrice;

  ProductDetails({
    required this.productName,
    required this.description,
    required this.imageUrls ,
    required this.priceFallInPercentage,
    required this.actualPrice,
    required this.productType ,
    required this.productColor ,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);


  static List<ProductDetails> listFromJson( List<dynamic> json){
    return json.map((productJson) => ProductDetails.fromJson(productJson)).toList() ;
  }
}


