import 'package:MoboPex/src/view/ui/screens/navigation/home/festive_sale.dart';
import 'package:MoboPex/src/view/ui/screens/navigation/home/top_pick.dart';
import 'package:MoboPex/src/view/ui/widgets/carousel/carousel_with_dot.dart';
import 'package:MoboPex/src/view/ui/widgets/home/heading.dart';
import 'package:MoboPex/src/view_model/dashboard/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
    HomePage({super.key});

  final homeController = Get.put(HomeController());

  int currentIndex = 0 ;

   List<String> imageUrls = [
     'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dGVtcGVyZWQlMjBnbGFzcyUyMG1vYmlsZXxlbnwwfHwwfHx8MA%3D%3D',
     'https://as2.ftcdn.net/v2/jpg/02/29/73/01/1000_F_229730166_H5mfxAoOCDUKTB2I43b7DTk2U8yAvwy3.jpg'
     'https://t3.ftcdn.net/jpg/07/20/22/66/240_F_720226639_w4KjXArjPUssDbSx8B5PyDvGHOxBb2bN.jpg',
   ];

  @override
  Widget build(BuildContext context) {
    return Obx(() =>SafeArea(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            children: [
              Heading(
                  isSearching: homeController.searchController.isSearching.value,
                  headingTxt: "New Here ?",
                  isIcon: false,
                  subHeading: "Find the best tempered glasses",
                  onPressedBackBtn: (){},
                  onChanged: (value){}),
               const SizedBox(height:24),

             Expanded(
               child: SingleChildScrollView(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     CarouselWithDot(imageUrl: imageUrls),
                     FestiveSale(),
                     TopPick(),
                   ]
                 ),
               ),
             )





        ],
            ),
      ),
    )
    );
  }
}
