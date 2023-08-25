// import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:employee_management/utils/constants/imports.dart';

class SplashScreenController extends GetxController {
  final GlobalController _globalController = Get.find<GlobalController>();
  final SpController _spController = SpController();
  late FirebaseMessaging messaging;

  @override
  void onInit() async {
    await getRemember();
    if (rememberStatus == null) _spController.onLogout();
    await _globalController.setLoginStatus();
    startSplashScreen();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) async {
      await _spController.saveDeviceToken(value.toString());
    });
    super.onInit();
  }

  bool? rememberStatus = true;
  Future<void> getRemember() async {
    bool? state = await _spController.getRememberMe();
    if (state == null || state == false) {
      rememberStatus = false;
    } else {
      rememberStatus = true;
    }
  }

  Timer startSplashScreen() {
    _globalController.parentRoute.value = "splash-screen";
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () async {
        if (_globalController.isLoggedIn.value) {
          Get.offNamed(krSplashScreen);
          Get.toNamed(krEmployeeHomepage);
          // Get.find<HomeController>().isHomePageLoading.value = true;
          //todo:: call home api
        } else {
          // Get.find<AuthController>().resetLoginScreen();
          Get.offAllNamed(krLogin);
        }
      },
    );
  }
}
