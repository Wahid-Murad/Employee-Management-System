import 'package:employee_management/utils/constants/imports.dart';
import 'package:intl/intl.dart';

ProfileController profileController = Get.find<ProfileController>();

class HomeController extends GetxController {
  final ApiController _apiController = ApiController();
  final SpController _spController = SpController();
  // final GlobalController _globalController = Get.find<GlobalController>();
  //*For current date and time
  RxString currentDate = RxString(DateFormat("dd MMM yyyy").format(DateTime.now()));
  var formattedTime = DateFormat.Hm().format(DateTime.now());
  //*For 4 buttons enable and disable
  RxBool isCheckIn = RxBool(false);
  RxBool isCheckOut = RxBool(false);
  // RxBool isTakeBreak = RxBool(false);
  // RxBool isBackWork = RxBool(false);
  RxBool isCheckInVisible = RxBool(true);
  RxBool isCheckOutVisible = RxBool(false);
  RxBool isTakeBreakVisible = RxBool(false);
  RxBool isBackWorkVisible = RxBool(false);

  currentTimeFormat() {
    var formattedTime = DateFormat.Hm().format(DateTime.now());
    int currentHour = int.parse(formattedTime.split(':')[0]);
    if (currentHour <= 12 && currentHour >= 0) {
      return ' Morning';
    } else {
      return ' Evening';
    }
  }

  checkInCardEnableDisable() {
    if (isCheckInVisible.value == false) {
      isCheckOutVisible.value = true;
      isTakeBreakVisible.value = true;
      isBackWorkVisible.value = false;
      isCheckIn.value = true;
    }
    if (isCheckIn.value == true) {
      profileController.timer = Timer.periodic(const Duration(seconds: 1), profileController.updateTimer);
    }
  }

  takeBreakCardEnableDisable() {
    if (isTakeBreakVisible.value == true) {
      isCheckOutVisible.value = false;
      isBackWorkVisible.value = true;
    }
  }

  backWorkCardEnableDisable() {
    if (isBackWorkVisible.value == true) {
      isCheckOutVisible.value = true;
      isTakeBreakVisible.value = true;
      isBackWorkVisible.value = false;
    }
  }

  checkOutCardEnableDisable() {
    if (isCheckOutVisible.value == true) {
      isCheckInVisible.value = false;
      isTakeBreakVisible.value = false;
      isBackWorkVisible.value = false;
      isCheckOutVisible.value = false;
      isCheckOut.value = true;
    }
  }

  //*For Add Task
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskDependencyController = TextEditingController();
  TextEditingController taskDelayReasonController = TextEditingController();
  RxString taskTitleValue = RxString('');
  RxString taskDescriptionValue = RxString('');
  RxString taskDependencyValue = RxString('NA');
  RxString taskDelayReasonValue = RxString('NA');
  FocusNode taskTitleTextFieldFocus = FocusNode();
  FocusNode taskDescriptionTextFieldFocus = FocusNode();
  FocusNode taskDelayReasonTextFieldFocus = FocusNode();
  FocusNode taskDependencyTextFieldFocus = FocusNode();
  RxBool isTaskTitleDescriptionValue = RxBool(false);
  claerAddTaskTextField() {
    taskTitleController.clear();
    taskDescriptionController.clear();
    taskDelayReasonController.clear();
    taskDependencyController.clear();
  }

  taskTitleDescriptionCheck() {
    if (taskTitleController.value != '' || taskDescriptionValue.value != '') {
      isTaskTitleDescriptionValue.value = true;
    } else {
      isTaskTitleDescriptionValue.value = false;
    }
    print(isTaskTitleDescriptionValue.value);
    return isTaskTitleDescriptionValue.value;
  }
  //*Newly Added
  // Rx<HomeModel?> homeData = Rx<HomeModel?>(null);
  // RxBool isHomePageLoading = RxBool(true);
  // getUserHome(context) async {
  //   try {
  //     isHomePageLoading.value = true;
  //     String? token = await _spController.getBearerToken();
  //     // ll(token);
  //     var response = await _apiController.commonGet(url: kuGetUserHome, token: token, showLoading: false, context: context);
  //     if (response.success == true) {
  //       // homeData.value = HomeModel.fromJson(response.data);
  //       // ll(homeData.value!.recentDrawResults[0].toString());
  //       isHomePageLoading.value = false;
  //       //CustomSnackBar(title: ksSuccess.tr, description: response.message, snackBarType: SnackBarType.success).show(context);
  //     } else {
  //       if (response.type != null && (response.type == "not_auth" || response.type == "not_active" || response.type == "not_verified")) {
  //         Get.offAllNamed(krLogin);
  //       }
  //       CustomSnackBar(title: ksError.tr, description: response.message, snackBarType: SnackBarType.error).show(context);
  //     }
  //   } catch (e) {
  //     ll('getUserHome error: $e');
  //   }
  // }

}
