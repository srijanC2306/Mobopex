import 'package:MoboPex/src/view_model/dashboard/home/search/search_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final searchController  = Get.put(SearchFieldController());
}