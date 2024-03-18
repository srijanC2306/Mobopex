// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      productName: json['productName'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      priceFallInPercentage: json['priceFallInPercentage'] as String,
      actualPrice: json['actualPrice'] as String,
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'priceFallInPercentage': instance.priceFallInPercentage,
      'actualPrice': instance.actualPrice,
    };
