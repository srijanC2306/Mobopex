import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/asset_constants.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:MoboPex/src/view/ui/screens/dashboard/dashboard.dart';
import 'package:MoboPex/src/view/ui/widgets/login/custom_form_field.dart';
import 'package:MoboPex/src/view_model/onboarding/login_controller.dart';
import '../../../../../routes/route_constants.dart';
import '../../widgets/login/login_header.dart';

class LoginScreen extends StatelessWidget {

    LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Obx(
        () => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            child: Container(
              height: size.height,
              color: loginController.toggleValue.value
                  ? ColorConstants.primaryColor
                  : Colors.white,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 36.0, top: 24, right: 36),
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LoginHeader(
                          toggleValue: loginController.toggleValue.value,
                          onChanged: loginController.onChanged,
                        ),
                        const SizedBox(height: 40.0),
                        Center(
                          child: SizedBox(
                              height: 180,
                              child: Image.asset(loginController.toggleValue.value
                                  ? AssetConstants.icLogo
                                  : AssetConstants.icLogoPrimary)),
                        ),
                        const SizedBox(height: 40.0),
                        Text(
                          "Thank you for choosing MoboPex!",
                          style: BaseTextStyle(
                              color: loginController.toggleValue.value
                                  ? Colors.white
                                  :ColorConstants.textColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 33.0),
                        Text(
                          loginController.toggleValue.value?"Proceed with Wholesaler":"Proceed with Retailer",
                          style: BaseTextStyle(
                              color: loginController.toggleValue.value
                                  ? Colors.white
                                  :ColorConstants.textColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Login",
                          style: BaseTextStyle(
                              color: loginController.toggleValue.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 35.0,
                        ),
                        CustomFormField(
                            errorText: "Please enter correct email",
                            isWholeSeller: !loginController.toggleValue.value,
                            controller: loginController.userNameController,
                            heading: "Username",
                            hintText: "Enter Username"),
                        const SizedBox(
                          height: 35.0,
                        ),
                        CustomFormField(
                          errorText: "Please enter correct password",
                            isPassword: true,
                            isWholeSeller: !loginController.toggleValue.value,
                            controller: loginController.passwordController,
                            heading: "Password",
                            hintText: "Enter Password"),
                        const SizedBox(height: 35.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                 Navigator.push(context, MaterialPageRoute(builder: (_)=>const Dashboard()));
                                debugPrint("validated");
                              }
                              // Button onPressed callback
                            },
                            style: ButtonStyle(
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                     const  RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                              backgroundColor: MaterialStateProperty.all(
                                loginController.toggleValue.value
                                    ? Colors.white
                                    : ColorConstants
                                        .primaryColor, // Set color based on condition
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: BaseTextStyle(
                                  color: loginController.toggleValue.value
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
                              "Don’t have an account yet?",
                              style: BaseTextStyle(
                                  color: loginController.toggleValue.value
                                      ? Colors.white
                                      :ColorConstants.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(RouteConstants.registerRoute);
                              },
                              child: Text(
                                "  Register",
                                style: BaseTextStyle(
                                    color: !loginController.toggleValue.value
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
