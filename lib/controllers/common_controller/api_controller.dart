import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:employee_management/utils/constants/imports.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
// import 'package:pricebond/models/common_data_model.dart';
// import 'package:pricebond/models/environment.dart';
// import 'package:pricebond/utils/constants/imports.dart';

class ApiController {
  final _globalController = Get.find<GlobalController>();

  _convertToCommonObject(apiResponse) {
    // var responseMap = jsonDecode(apiResponse.body);
    return CommonDM.fromJson(apiResponse);
  }

  //* info:: common get
  Future<dynamic> commonGet({
    required String? token,
    required String url,
    required bool showLoading,
    required BuildContext context,
    int? timer,
  }) async {
    log("url:$url");
    if (showLoading) {
      _globalController.showLoading();
    }
    final http.Client client = http.Client();
    final Uri uri = Uri.parse(Environment.baseUrl + url);

    http.Response response;
    String error = ksAnErrorOccurred.tr;
    try {
      response = await client.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'app-role': 'user',
        },
      ).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          error = ksConnectionTimeoutMessage.tr;
          if (showLoading) {
            if (_globalController.isLoading.value) {
              _globalController.isLoading.value = false;
              Get.back();
            }
          }
          CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
          throw TimeoutException(ksConnectionTimeoutMessage.tr);
        },
      );
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      ll("response : ${response.body}");
      CommonDM cm = _convertToCommonObject(jsonDecode(response.body));
      return cm;
      // return jsonDecode(response.body);
    } on SocketException {
      error = ksNoInternetConnectionMessage.tr;
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
      return null;
    } catch (e) {
      log(e.toString());
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
      return null;
    } finally {
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      client.close();
    }
  }

  //* info:: common post with body and token
  Future<dynamic> commonPostWithBodyAndToken({
    required String? token,
    required String url,
    required Map<String, dynamic> body,
    required bool showLoading,
    required BuildContext context,
    int? timer,
  }) async {
    if (showLoading) {
      _globalController.showLoading();
    }
    final http.Client client = http.Client();
    final Uri uri = Uri.parse(Environment.baseUrl + url);
    http.Response response;
    String error = ksAnErrorOccurred.tr;
    try {
      response = await client
          .post(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'app-role': 'user',
        },
        body: body,
      )
          .timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          error = ksConnectionTimeoutMessage.tr;
          if (showLoading) {
            if (_globalController.isLoading.value) {
              _globalController.isLoading.value = false;
              Get.back();
            }
          }
          CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
          throw TimeoutException(ksConnectionTimeoutMessage.tr);
        },
      );
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      ll("response : ${response.body}");
      // return jsonDecode(response.body);
      CommonDM cm = _convertToCommonObject(jsonDecode(response.body));
      return cm;
    } on SocketException {
      error = ksNoInternetConnectionMessage.tr;
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
      return null;
    } catch (e) {
      log(e.toString());
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }

      CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
      return null;
    } finally {
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      client.close();
    }
  }

  //* info:: common post with body [without token, like login, forget password api]
  Future<dynamic> commonPostWithBody({
    required String url,
    required Map<String, dynamic> body,
    required bool showLoading,
    required BuildContext context,
    int? timer,
  }) async {
    if (showLoading) {
      _globalController.showLoading();
    }

    final http.Client client = http.Client();
    final Uri uri = Uri.parse(Environment.baseUrl + url);
    http.Response response;
    String error = ksAnErrorOccurred.tr;
    try {
      response = await client.post(
        uri,
        body: body,
        // headers: {'app-role': 'user'},
      ).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          error = ksConnectionTimeoutMessage.tr;
          if (showLoading) {
            if (_globalController.isLoading.value) {
              _globalController.isLoading.value = false;
              Get.back();
            }
          }
          CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
          throw TimeoutException(ksConnectionTimeoutMessage.tr);
        },
      );
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      ll("response : ${jsonDecode(response.body)}");
      CommonDM cm = _convertToCommonObject(jsonDecode(response.body));
      return cm;
      // return jsonDecode(response.body);
    } on SocketException {
      error = ksNoInternetConnectionMessage.tr;
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
      return null;
    } catch (e) {
      log(e.toString());
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
      return null;
    } finally {
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      client.close();
    }
  }

  // dio post type of request
  Future<dynamic> commonPostWithBodyDio({
    required String url,
    required String? token,
    required Map<String, dynamic> body,
    required bool showLoading,
    required BuildContext context,
    int? timer,
  }) async {
    // log(url.toString());
    // log(body.toString());
    if (showLoading) {
      _globalController.showLoading();
    }
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer $token";
    dio.options.headers['app-role'] = "user";
    String error = ksAnErrorOccurred.tr;
    try {
      var response = await dio.post(Environment.baseUrl + url, data: body).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          error = ksConnectionTimeoutMessage.tr;
          if (showLoading) {
            if (_globalController.isLoading.value) {
              _globalController.isLoading.value = false;
              Get.back();
            }
          }
          CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
          throw TimeoutException(ksConnectionTimeoutMessage.tr);
        },
      );
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
      // ll("response : " + response.data.toString());
      CommonDM cm = _convertToCommonObject(response.data);
      return cm;
      // return response.data;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        error = ksNoInternetConnectionMessage.tr;
        if (showLoading) {
          if (_globalController.isLoading.value) {
            _globalController.isLoading.value = false;
            Get.back();
          }
        }

        CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
        return null;
      } else {
        log(e.toString());
        if (showLoading) {
          if (_globalController.isLoading.value) {
            _globalController.isLoading.value = false;
            Get.back();
          }
        }
        CustomSnackBar(title: ksError.tr, description: error, snackBarType: SnackBarType.error).show(context);
        return null;
      }
    } finally {
      if (showLoading) {
        if (_globalController.isLoading.value) {
          _globalController.isLoading.value = false;
          Get.back();
        }
      }
    }
  }
}
