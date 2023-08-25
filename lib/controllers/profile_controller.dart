import 'package:employee_management/utils/constants/imports.dart';
import 'package:intl/intl.dart';

HomeController homeController = Get.find<HomeController>();

class ProfileController extends GetxController {
  RxString phone = RxString('01766098919');
  RxString email = RxString('wahidmurad2000@gmail.com');
  RxString address = RxString('West Shewrapara,Mirpur');
  RxString dateOfBirth = RxString('18-07-2001');

  //*for logout
  void logout(context) {
    showAlertDialog(
      context: context,
      child: CommonAlertDialog(
        title: ksConfirmation.tr,
        addContent: Padding(
          padding: const EdgeInsets.symmetric(vertical: k15Padding),
          child: Text(
            ksAreYouSureYouWantToLogout.tr,
            textAlign: TextAlign.center,
            style: p14MediumTextStyle(cTextPrimaryColor),
          ),
        ),
        actions: [
          CustomElevatedButton(
            buttonWidth: width * .5,
            label: ksLogout.tr,
            buttonColor: cRedAccentColor,
            onPressed: () async {
              // await userProfileLogout(context);
            },
          ),
          kH10sizedBox,
        ],
        hasCloseBtn: true,
        onClose: () => Get.back(),
      ),
    );
  }

  //*Circular progress indicator time counter
  late Timer timer;
  Rx<DateTime> _startTime = DateTime.now().obs;
  Rx<DateTime> _endTime = (DateTime.now().add(Duration(hours: 8))).obs;

  final RxString formattedTime = '00:00:00'.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   timer = Timer.periodic(Duration(seconds: 1), updateTimer);
  // }

  void updateTimer(Timer timer) {
    if (homeController.isCheckIn.value == true) {
      if (DateTime.now().isBefore(_endTime.value)) {
        Duration difference = _endTime.value.difference(DateTime.now());
        formattedTime.value = DateFormat('HH:mm:ss').format(DateTime(0).add(difference));
      }
    }
    if (homeController.isCheckOut.value == true) {
      timer.cancel();
    }
    // if (homeController.isCheckOut.value == true) {
    //   if (DateTime.now().isBefore(_endTime.value)) {
    //     Duration difference = _endTime.value.difference(DateTime.now());
    //     formattedTime.value = DateFormat('HH:mm:ss').format(DateTime(0).add(difference));
    //   }
    //   print(homeController.isCheckOut.value);
    // }
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
