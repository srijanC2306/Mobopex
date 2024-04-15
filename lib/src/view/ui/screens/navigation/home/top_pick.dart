import 'package:MoboPex/src/view/ui/screens/navigation/home/product_page.dart';
import 'package:MoboPex/src/view/ui/screens/navigation/home/top_pick_details.dart';
import 'package:MoboPex/src/view_model/dashboard/home/top_pick/top_pick_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/home/heading_with_view.dart';

class TopPick extends StatefulWidget {
  final GlobalKey<NavigatorState> navKey;

  const TopPick({super.key, required this.navKey});

  @override
  State<TopPick> createState() => _TopPickState();
}

class _TopPickState extends State<TopPick> {
  final topPickController = Get.put(TopPickController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeadingWithView(
            heading: "Top Pick",
            navKey: widget.navKey,
          ),
          const SizedBox(height: 12),
          GetBuilder<TopPickController>(builder: (controller) {
            return Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 9 / 16),
                  itemCount: controller.productDetails.length - 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        widget.navKey.currentState!.push(MaterialPageRoute(
                            builder: (_) => ProductPage(
                                  productColor: controller
                                      .productDetails[index].productColor,
                                  productName: controller
                                      .productDetails[index].productName,
                                  productType: controller
                                      .productDetails[index].productType,
                                  specification: controller
                                      .productDetails[index].description,
                                  imageUrls: controller
                                      .productDetails[index].imageUrls,
                                )));
                      },
                      child: HomeFeedItem(
                        imageSrc:
                            controller.productDetails[index].imageUrls.first,
                        heading: controller.productDetails[index].productName,
                        description:
                            controller.productDetails[index].description,
                      ),
                    );
                  }),
            );
          }),
        ],
      ),
    );
  }
}
