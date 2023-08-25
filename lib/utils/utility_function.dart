import 'dart:developer';

import 'package:employee_management/utils/constants/imports.dart';

void heightWidthKeyboardValue(context) {
  height = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
  keyboardValue = MediaQuery.of(context).viewInsets.bottom;
}

double getPaddingTop(context) => MediaQuery.of(context).padding.top;

void unfocus(context) {
  FocusScope.of(context).unfocus();
}

void ll(message) {
  log(message.toString());
}

extension CapitalizeExtension on String {
  String get capitalizeFirstOfEach => split(" ").map((str) => str.capitalizeFirst).join(" ");
  bool get isValidEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);
}

// show alert dialog
Future<dynamic> showAlertDialog({context, child}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) => child,
  );
}

void search({searchList, list, searchController}) {
  searchList.value = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i]['name'].toString().toLowerCase().contains(searchController.text.toLowerCase())) {
      searchList.add(list[i]);
    }
  }
}

//*Newly Added
//* compare device height
bool isDeviceScreenLarge() {
  if (height > kSmallDeviceSizeLimit) {
    return true;
  } else {
    return false;
  }
}

deviceSizeBasedContainerHeight() {
  height > kSmallDeviceSizeLimit ? 100 : 40;
}

deviceSizeBasedContainerWidght() {
  width > kSmallDeviceSizeLimit ? 60 : 40;
}

String ordinal(int number) {
  switch (number) {
    case 1:
      return '${number}st';
    case 2:
      return '${number}nd';
    case 3:
      return '${number}rd';
    default:
      return '${number}th';
  }
}
