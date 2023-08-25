import 'dart:convert';
import 'dart:io';
import 'package:employee_management/utils/constants/imports.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class GlobalController extends GetxController {
  final SpController _spController = SpController();
  final RxMap appLang = RxMap({'langCode': 'en', 'countryCode': 'US'});

  final RxString registerToken = RxString('');
  final Rx<BuildContext?> homeContext = Rx<BuildContext?>(null);
  //* info:: user info
  final RxBool isLoggedIn = RxBool(false);
  final RxString userName = RxString('Esmeralda');
  final RxString userEmail = RxString('esmer@gmail.com');
  final Rx<String?> userImage = Rx<String?>('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqrBeXjvqxwFLKcCALj9GaRqraeyT2Hjl5HQ&usqp=CAU');
  final Rx<String?> userPhone = Rx<String?>('');
  final RxString phoneNumber = RxString('01642318836');
  final Rx<String?> userAddress = Rx<String?>(null);
  final Rx<String?> bearerToken = Rx<String?>(null);
  final RxList languages = RxList([
    {'langCode': 'bn', 'countryCode': 'BD', 'langName': 'Bengali'},
    {'langCode': 'en', 'countryCode': 'US', 'langName': 'English'},
  ]);

  //* info:: login status setup
  final loginTokenWithoutVerification = RxString('');
  Future<void> setLoginStatus() async {
    bearerToken.value = await _spController.getBearerToken();
    if (bearerToken.value != null) {
      isLoggedIn.value = true;
      // userLanguageCode.value = await _spController.getLanguageCode();
      // updateAppLang(langCode: userLanguageCode.value);
    } else {
      isLoggedIn.value = false;
      // userLanguageCode.value = await _spController.getLanguageCode();
      // updateAppLang(langCode: userLanguageCode.value);
    }
  }

  // todo:: if not needed remove this function
  //* info:: date formate
  // String dateFormatAsApp(dynamic date) {
  //   if ((date.toString().contains(RegExp(r'[a-z]')))) return date;
  //   var data = (date is DateTime) ? date : DateTime.parse(date);
  //   final DateFormat appFormatter = DateFormat("d MMM, yyyy" /*, appLang['langCode']*/);
  //   return appFormatter.format(data);
  // }

  //* parent route
  final RxString parentRoute = RxString("");

  //* info:: show loading
  final isLoading = RxBool(false);

  void showLoading() {
    isLoading.value = true;
    Get.defaultDialog(
      radius: 2,
      backgroundColor: cWhiteColor,
      barrierDismissible: false,
      title: "",
      onWillPop: () async {
        return true;
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpinKitFadingCircle(
            color: cPrimaryColor,
            size: 70.0,
          ),
          const SizedBox(height: k10Padding),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              ksLoading.tr,
              style: const TextStyle(color: cPrimaryColor, fontSize: h14),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  //* info:: pick image
  Future<void> pickImage({
    required isChanged,
    required imageLink,
    required imageFile,
    required context,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => CommonAlertDialog(
        onClose: () {
          Get.back();
        },
        addContent: SizedBox(
          height: 120,
          width: width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(k20Padding, 0, k20Padding, k20Padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: kTextButtonStyle,
                  onPressed: () {
                    selectImageSource(isChanged, imageLink, imageFile, 'camera');
                  },
                  child: CircleAvatar(
                    backgroundColor: cTransparentColor,
                    radius: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.camera_alt_sharp,
                          color: cPrimaryColor,
                          size: 60.0,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          ksTakeAPicture.tr,
                          style: p14MediumTextStyle(cTextPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                  style: kTextButtonStyle,
                  onPressed: () {
                    selectImageSource(isChanged, imageLink, imageFile, 'gallery');
                  },
                  child: CircleAvatar(
                    backgroundColor: cTransparentColor,
                    radius: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo_camera_back_outlined, //todo:: add Gallery icon
                          color: cPrimaryColor,
                          size: 50.0,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          ksGallery.tr,
                          style: p14MediumTextStyle(cTextPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        hasCloseBtn: true,
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> selectImageSource(isChanged, imageLink, imageFile, String source) async {
    try {
      final XFile? _image = await _picker.pickImage(
        source: source == 'gallery' ? ImageSource.gallery : ImageSource.camera,
        maxHeight: 480,
        maxWidth: 720,
      );
      if (_image != null) {
        final List<int> imageBytes = await _image.readAsBytes();
        final String base64Image = base64Encode(imageBytes);
        final File imageTemporary = File(_image.path);
        // var value = await _image.length();
        // ll(value);
        imageFile(imageTemporary);
        isChanged.value = true;
        imageLink.value = 'data:image/png;base64,' + base64Image;
        // log(imageLink.toString());
        Get.back();
      } else {
        ll('image not selected');
        return;
      }
    } on PlatformException catch (e) {
      ll("Failed to Pick Image $e");
    }
  }

  //* default dateTime format
  DateTime timeToDateTimeFormat(time) {
    var date = "2012-02-27 ";
    var data = DateTime.parse(date + time + ":00");
    return data;
  }

  //* multi selectable calender
  void multiSelectableCalender({
    required context,
    required Rx<PickerDateRange> selectedDates,
    onApply,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(k5BorderRadius), topRight: Radius.circular(k5BorderRadius)),
      ),
      context: context,
      backgroundColor: cWhiteColor,
      builder: (c) {
        PickerDateRange _selectedDates = selectedDates.value;
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              SfDateRangePicker(
                //* actions
                showNavigationArrow: true,
                showActionButtons: true,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  if (args.value is PickerDateRange) {
                    _selectedDates = args.value;
                  }
                },
                selectionMode: DateRangePickerSelectionMode.range,
                enablePastDates: true,
                initialSelectedRange: _selectedDates,

                //* text styles and colors
                todayHighlightColor: cPrimaryColor,
                headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center, textStyle: buttonTextStyle(cTextPrimaryColor)),
                rangeTextStyle: p14MediumTextStyle(cWhiteColor),
                selectionTextStyle: p14MediumTextStyle(cWhiteColor),
                monthViewSettings: DateRangePickerMonthViewSettings(
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: p14RegularTextStyle(cTextSecondaryColor)),
                ),
                monthCellStyle:
                    DateRangePickerMonthCellStyle(textStyle: p14MediumTextStyle(cTextPrimaryColor), todayTextStyle: p14MediumTextStyle(cPrimaryColor)),
                startRangeSelectionColor: cPrimaryColor,
                endRangeSelectionColor: cPrimaryColor,
                rangeSelectionColor: cPrimaryColor,
                selectionColor: cPrimaryColor,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                  color: cWhiteColor,
                  width: width - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        //* cancel button
                        label: ksCancel.tr,
                        onPressed: () {
                          Get.back();
                        },
                        buttonWidth: width / 3,
                        buttonHeight: 40,
                        textStyle: p16MediumTextStyle(cTextPrimaryColor),
                        buttonColor: cWhiteColor,
                      ),
                      CustomElevatedButton(
                        //* done button
                        label: ksApply.tr,
                        onPressed: () {
                          Get.back();
                          selectedDates.value = _selectedDates;
                          onApply();
                        },
                        buttonWidth: width / 3,
                        buttonHeight: 40,
                        buttonColor: cPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  dateFormatterForPriceBond(date) {
    return DateFormat('dd MMM yyyy', "en").format(DateTime.parse(date));
  }


 launchURL(url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
  //! end
}
