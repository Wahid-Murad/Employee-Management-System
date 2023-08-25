import 'package:employee_management/utils/constants/imports.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cBackgroundColor,
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  ksSignInNow,
                  style: p24RegularTextStyle(cWhiteColor),
                ),
              ),
              kH10sizedBox,
              Center(
                child: Text(
                  ksContinueOurApp,
                  style: p16RegularTextStyle(cTextSecondaryColor),
                ),
              ),
              kH20sizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomModifiedTextField(
                  maxLength: 60,
                  label: ksEmail.tr,
                  fillColor: cGreyColor,
                  controller: authController.loginEmailTextEditingController,
                  inputType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  onChanged: (v) {
                    authController.checkCanLogin();
                  },
                ),
              ),
              kH10sizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomModifiedTextField(
                  maxLength: 32,
                  label: ksPassword.tr,
                  controller: authController.loginPasswordTextEditingController,
                  inputAction: TextInputAction.go,
                  prefixIcon: Icons.lock,
                  obscureText: authController.passwordVisible.value,
                  suffixIcon: authController.passwordVisible.value ? Icons.visibility_off : Icons.visibility,
                  onSuffixPress: () {
                    authController.passwordVisible.value = !authController.passwordVisible.value;
                  },
                  onChanged: (v) {
                    authController.checkCanLogin();
                  },
                ),
              ),
              kH50sizedBox,
              //* info:: login button
              CustomElevatedButton(
                label: ksLogin.tr,
                buttonWidth: 200,
                onPressed: authController.canLogin.value
                    ? () async {
                        // await authController.login(context);
                        // authController.loginData.value!.user.usertype;
                        //*For Routing the employee homepage or admin homepage
                        const String userType = "owner";
                        if (userType == "owner") {
                          Get.offAllNamed(krOwnerHomepage);
                          // Get.offAllNamed(krEmployeeHomepage);
                        } else if (userType == "employee") {
                          FocusScope.of(context).unfocus();
                          Get.toNamed(krEmployeeHomepage);
                        }
                      }
                    : null,
                isButtonInPopUp: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
