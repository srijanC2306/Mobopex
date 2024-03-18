import 'dart:convert';

import 'package:MoboPex/src/model/data/home/product_details.dart';
import 'package:MoboPex/src/view/resources/asset_constants.dart';
import 'package:MoboPex/src/view_model/dashboard/home/search/search_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TopPickController extends GetxController{
  
  final searchController  = Get.put(SearchFieldController());
  
   List<ProductDetails> productDetails = <ProductDetails>[] ;

  @override
  void onInit() async{
     Future.delayed(const Duration(seconds: 1) , (){
       getProductDetails();
     });
    super.onInit();
  }

  Future<List<ProductDetails>> getProductDetails() async{
    final String jsonString = await rootBundle.loadString(AssetConstants.productDetailsJSON);
    final List<dynamic>  jsonData = jsonDecode(jsonString);
    productDetails = ProductDetails.listFromJson(jsonData) ;
    return productDetails ;
  }
}