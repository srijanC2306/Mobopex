import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final TextEditingController userNameController  = TextEditingController();
  final TextEditingController passwordController  = TextEditingController();

  RxBool toggleValue = false.obs ;

  void onChanged(bool value){
    toggleValue.value = !toggleValue.value ;
  }



}