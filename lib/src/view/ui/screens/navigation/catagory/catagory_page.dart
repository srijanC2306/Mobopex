import 'package:MoboPex/src/view/ui/widgets/navigator/base_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../view_model/dashboard/catagory_controller.dart';
import '../../../widgets/catagory/custom_chip.dart';
import '../../../widgets/home/heading.dart';

class Category extends StatelessWidget {
  Category({super.key});

  final categoryController = Get.put(CategoryController());



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseNavigator(
        builder: (navKey) => Obx(
              () => SafeArea(
                child: Scaffold(
                  body: CustomScrollView(
                    slivers:[ SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Heading(
                              headingTxt: "Catagory",
                              onPressedBackBtn: () {
                               // navKey.currentState!.pop();
                              },
                              isSearching: categoryController.topPickController
                                  .searchController.isSearching.value,
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 16),
                            CustomChip(chips: categoryController.chips.map((chip) => chip.chipName).toList() ,
                            pages:categoryController.pages,
                            ),
                            // Expanded(
                            //   child: GridView.builder(
                            //       gridDelegate:
                            //           const SliverGridDelegateWithFixedCrossAxisCount(
                            //               crossAxisCount: 2,
                            //               crossAxisSpacing: 10,
                            //               mainAxisSpacing: 10,
                            //               childAspectRatio: 9 / 16),
                            //       itemCount: 10,
                            //       itemBuilder: (context, index) {
                            //         return HomeFeedItem(
                            //           imageSrc:
                            //               "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
                            //           heading: "Product X",
                            //           description: 'A description ...',
                            //         );
                            //       }),
                            // ),
                          ],
                        ),
                      ),
                    )],
                  ),
                ),
              ),
            ));
  }
}
