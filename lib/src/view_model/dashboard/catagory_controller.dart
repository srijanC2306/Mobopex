import 'package:MoboPex/src/view/ui/widgets/catagory/catagory_details.dart';
import 'package:MoboPex/src/view_model/dashboard/home/top_pick/top_pick_controller.dart';
import 'package:get/get.dart';

class Chips{
  final String  chipName ; 
  
  Chips({required this.chipName}) ; 
}

class CategoryController extends GetxController{

  final topPickController = Get.put(TopPickController());

  final List<Chips> chips = [Chips(chipName: "All") , Chips(chipName: "Clear"), Chips(chipName: "Anti-glare") ,Chips(chipName: "Privacy"), Chips(chipName: "Colored")];
  
  final pages = List.generate(7, (index) => CategoryDetails());
}