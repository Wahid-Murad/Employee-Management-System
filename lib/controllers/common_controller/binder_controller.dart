import 'package:employee_management/utils/constants/imports.dart';

class BinderController implements Bindings {
  @override
  void dependencies() {
    //  Get.put<GlobalController>(GlobalController(), permanent: true);
    Get.put<GlobalController>(GlobalController());
    Get.put<SplashScreenController>(SplashScreenController());
    Get.put<AuthController>(AuthController());
    Get.put<HomeController>(HomeController());
    Get.put<ProfileController>(ProfileController());
  }
}
