
import 'package:MoboPex/src/view/ui/screens/navigation/home/top_pick_details.dart';
import 'package:MoboPex/src/view/ui/widgets/counter/counter_widget.dart';
import 'package:flutter/material.dart';

import '../../../base_stateless_widget.dart';
import '../../../resources/color_constants.dart';
class HeadingWithTimer extends StatelessWidget {
  final String heading  ;
  final DateTime endTime ;

   HeadingWithTimer({
    required this.heading ,
    required  this.endTime ,
    super.key});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(heading ,
              style: const BaseTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.primaryColor)

          ) ,
          CounterWidget(endTime:endTime)
        ],
      ),
    );
  }

}
