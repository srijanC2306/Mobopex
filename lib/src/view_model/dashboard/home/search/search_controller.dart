import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchFieldController extends GetxController{
  final TextEditingController _searchController = TextEditingController();

  RxBool isSearching = false.obs ;

  TextEditingController get searchController => _searchController;

  onPressedSearchIcon(){
    debugPrint("Click");
    isSearching.value = true ;
    debugPrint("Click true");
  }


  onPressedClearIcon(){
    _searchController.clear();
    isSearching.value = !isSearching.value;
  }

@override
  void dispose() {
   searchController.dispose();
    super.dispose();
  }

}