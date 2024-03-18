import 'package:MoboPex/src/view/ui/widgets/login/custom_form_field.dart';
import 'package:MoboPex/src/view_model/onboarding/register_controller.dart';
import '../../../../../routes/route_constants.dart';
import '../../../base_stateless_widget.dart';
import '../../../resources/asset_constants.dart';
import '../../../resources/color_constants.dart';
import '../../widgets/login/login_header.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  final registerController  = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    return Obx(()=> WillPopScope(

      onWillPop: () async {
        return false ;
      },
      child: Form(
        key: _formKey,
        child: Container(
          height: size.height,
          color: registerController.toggleValue.value
              ? ColorConstants.primaryColor
              : Colors.white,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 36.0, top: 24, right: 36.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginHeader(
                      toggleValue: registerController.toggleValue.value ,
                      onChanged:  registerController.onChanged,
                    ),
                    const SizedBox(height: 40.0),
                    Center(
                      child: SizedBox(
                          height: 180,
                          child: Image.asset(registerController.toggleValue.value?AssetConstants.icLogo: AssetConstants.icLogoPrimary )),
                    ),

                    Center(
                      child: Text(registerController.toggleValue.value?"Register as Retailer":"Register as Wholesaler", style: BaseTextStyle(
                          color: registerController.toggleValue.value?Colors.white: ColorConstants.primaryColor,
                          fontSize: 27,
                          fontWeight: FontWeight.w700

                      ),),
                    ),
                    const SizedBox(height: 36) ,
                    CustomFormField(
                        errorText: "Enter First Name ",
                        controller: registerController.firstNameController,
                        heading: "First Name",
                        hintText: "Enter First Name",
                        isWholeSeller: !registerController.toggleValue.value),
                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                        errorText: "Enter Middle Name",
                        controller: registerController.middleNameController,
                        heading: "Middle Name",
                        hintText: "Enter Middle Name",
                        isWholeSeller: !registerController.toggleValue.value),

                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                        errorText: "Enter Last Name",
                        controller: registerController.lastNameController,
                        heading: "Last Name",
                        hintText: "Enter Last Name",
                        isWholeSeller: !registerController.toggleValue.value),

                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                       errorText: "Enter Password",
                      isPassword: true,
                        controller: registerController.passwordController,
                        heading: "Password",
                        hintText: "Enter password",
                        isWholeSeller: !registerController.toggleValue.value),

                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                        isPassword: true,
                        controller: registerController.confirmPasswordController,
                        heading: "Confirm Password",
                        hintText: "Enter password",
                        isWholeSeller: !registerController.toggleValue.value),

                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                       isDateForm: true,
                        controller: registerController.dobController,
                        heading: "Date Of Birth",
                        hintText: "Enter DOB ",
                        isWholeSeller: !registerController.toggleValue.value),

                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                        controller: registerController.emailController,
                        heading: "Email",
                        hintText: "Enter Email",
                        isWholeSeller: !registerController.toggleValue.value),

                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                        controller: registerController.passwordController,
                        heading: "Phone",
                        hintText: "Enter Phone Number",
                        isWholeSeller: !registerController.toggleValue.value),

                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                        controller: registerController.addressController,
                        heading: "Address",
                        hintText: "Enter Address",
                        isWholeSeller: !registerController.toggleValue.value),

                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                        controller: registerController.businessController,
                        heading: "Business/Company",
                        hintText: "Enter details",
                        isWholeSeller: !registerController.toggleValue.value),
                    const SizedBox(height: 36.0) ,
                    CustomFormField(
                        isFileUpload: true,
                        controller: registerController.idProofController,
                        heading: "Identification Proof",
                        hintText: "Choose file to upload",
                        isWholeSeller: !registerController.toggleValue.value),

                    const SizedBox(height: 36.0) ,

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            debugPrint("All Field Validated") ;
                          }
                          // Button onPressed callback
                        },
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              const  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero)),
                          backgroundColor: MaterialStateProperty.all(
                            registerController.toggleValue.value
                                ? Colors.white
                                : ColorConstants
                                .primaryColor, // Set color based on condition
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: BaseTextStyle(
                              color: registerController.toggleValue.value
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: BaseTextStyle(
                              color: registerController.toggleValue.value
                                  ? Colors.white
                                  :ColorConstants.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RouteConstants.loginRoute);
                          },
                          child: Text(
                            "  Login",
                            style: BaseTextStyle(
                                color: !registerController.toggleValue.value
                                    ? ColorConstants.primaryColor
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 60.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
