import 'dart:developer';

import 'package:employee_management/models/auth_models/auth_model.dart';
import 'package:employee_management/utils/constants/imports.dart';

class AuthController extends GetxController {
  final ApiController _apiController = ApiController();
  final SpController _spController = SpController();
  final GlobalController _globalController = Get.find<GlobalController>();
  TextEditingController loginEmailTextEditingController = TextEditingController();
  TextEditingController loginPasswordTextEditingController = TextEditingController();
  final RxBool isLoginRememberCheck = RxBool(false);
  final RxBool passwordVisible = RxBool(true);
  final RxBool canLogin = RxBool(false);

  void checkCanLogin() {
    if (loginEmailTextEditingController.text.isValidEmail && loginPasswordTextEditingController.text.length >= kMinPasswordLength) {
      canLogin.value = true;
    } else {
      canLogin.value = false;
    }
  }

  Future<void> setDeviceID(context, id) async {
    try {
      String? token = await _spController.getBearerToken();
      String? deviceToken = await _spController.getDeviceToken();
      Map<String, dynamic> body = {
        'user_id': id.toString(),
        'device_token': deviceToken.toString(),
      };
      //await _apiController.commonPostWithBodyAndToken(url: kuSetDeviceID, token: token, body: body, showLoading: false, context: context);
    } catch (e) {
      ll('setDeviceID error: $e');
    }
  }

//*For User Login
  Rx<AuthModel?> loginData = Rx<AuthModel?>(null);
  Future<void> login(context) async {
    try {
      Map<String, String> body = {
        'email': loginEmailTextEditingController.text.toString(),
        "password": loginPasswordTextEditingController.text.toString(),
      };
      var response = await _apiController.commonPostWithBody(url: kuLogin, body: body, showLoading: true, context: context);

      if (response.success == true) {
        _globalController.parentRoute.value = "login";
        loginData.value = AuthModel.fromJson(response.data);
        log('Login_user_data : ${loginData.value!.token}');
        await _spController.saveBearerToken(loginData.value!.token);
        await _spController.saveRememberMe(isLoginRememberCheck.value);
        Get.offAllNamed(krEmployeeHomepage);
        // CustomSnackBar(title: ksSuccess.tr, description: response.message, snackBarType: SnackBarType.success).show(context);
      } else {
        // CustomSnackBar(title: ksError.tr, description: response.message, snackBarType: SnackBarType.error).show(context);
      }
    } catch (e) {
      ll('userLogin error: $e');
    }
  }
}
