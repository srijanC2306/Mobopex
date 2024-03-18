import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:flutter/material.dart';

import '../../../../view_model/dashboard/home/search/search_controller.dart';

class SearchWidgets extends StatelessWidget {
  final ValueChanged<String>? onChanged;
   final bool isSearching ;

   final searchController =   Get.put(SearchFieldController()) ;

   SearchWidgets({Key? key,
    required this.isSearching ,
    this.onChanged}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(()=> AnimatedContainer(
        duration: const Duration(microseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.primaryColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        width:  searchController.isSearching.value ? double.infinity *.80: 70,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: searchController.onPressedSearchIcon
            ),
            if(isSearching)
            Expanded(
              child:TextField(
                controller: searchController.searchController,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: searchController.onPressedClearIcon
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

