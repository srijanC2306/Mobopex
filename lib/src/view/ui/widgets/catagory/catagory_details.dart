import 'package:flutter/material.dart';

import '../../screens/navigation/home/top_pick_details.dart';
class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return    Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 0,
              childAspectRatio: 9 / 16),
          itemCount: 10,
          itemBuilder: (context, index) {
            return HomeFeedItem(
              imageSrc:
              "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
              heading: "Product X",
              description: 'A description ...',
            );
          }),
    );
  }
}
