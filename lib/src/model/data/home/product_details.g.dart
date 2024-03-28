// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      productName: json['productName'] as String,
      description: json['description'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      priceFallInPercentage: json['priceFallInPercentage'] as String,
      actualPrice: json['actualPrice'] as String,
      productType: json['productType'] as String,
      productColor: json['productColor'] as String,
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'priceFallInPercentage': instance.priceFallInPercentage,
      'productType': instance.productType,
      'productColor': instance.productColor,
      'actualPrice': instance.actualPrice,
    };
