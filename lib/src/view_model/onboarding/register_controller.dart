import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  final TextEditingController firstNameController  = TextEditingController();
  final TextEditingController middleNameController  = TextEditingController();
  final TextEditingController lastNameController  = TextEditingController();
  final TextEditingController passwordController  = TextEditingController();
  final TextEditingController confirmPasswordController  = TextEditingController();
  final TextEditingController dobController  = TextEditingController();
  final TextEditingController emailController  = TextEditingController();
  final TextEditingController phoneController  = TextEditingController();
  final TextEditingController addressController  = TextEditingController();
  final TextEditingController businessController  = TextEditingController();
  final TextEditingController idProofController  = TextEditingController();


  RxBool toggleValue = false.obs ;

  void onChanged(bool value){
    toggleValue.value = !toggleValue.value ;
  }

}