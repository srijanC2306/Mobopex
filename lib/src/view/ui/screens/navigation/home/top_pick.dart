
import 'package:MoboPex/src/view/ui/screens/navigation/home/top_pick_details.dart';
import 'package:MoboPex/src/view_model/dashboard/home/top_pick/top_pick_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/home/heading_with_view.dart';
class TopPick extends StatelessWidget {
   TopPick({super.key});

  final topPickController = Get.put(TopPickController());

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
        HeadingWithView(heading: "Top Pick"),
          const SizedBox(height: 16.0) ,
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2 ,
                    crossAxisSpacing: 30 ,
                    mainAxisSpacing: 0 ,
                    childAspectRatio: 9/16
                ),
                itemCount: topPickController.productDetails.length,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){

                    },
                    child:  HomeFeedItem(
                      imageSrc:  topPickController.productDetails[index].imageUrl,
                      heading: topPickController.productDetails[index].productName,
                      description: topPickController.productDetails[index].description,

                    ),
                  ) ;

                }),
          ),


        ],
      ),
    );
  }
}
