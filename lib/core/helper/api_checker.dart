import 'dart:developer';

import 'package:foodease/core/data/model/api_response.dart';
import 'package:foodease/core/data/model/error_response.dart';
import 'package:foodease/core/localization/language_constrants.dart';
import 'package:foodease/core/widgets/common/show_custom_snakbar_widget.dart';
import 'package:foodease/main.dart';

class ApiChecker {
  static void checkApi(ApiResponse apiResponse) {
    if (apiResponse.error == "Failed to load data - status code: 401") {
      // Provider.of<AuthController>(Get.context!, listen: false)
      //     .clearSharedData();
    } else if (apiResponse.response?.statusCode == 500) {
      showCustomSnackBar(
          getTranslated('internal_server_error', Get.context!), Get.context!);
    } else {
      log("==ff=>${apiResponse.error}");
      String? errorMessage = apiResponse.error.toString();
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = ErrorResponse.fromJson(apiResponse.error);
        log(errorResponse.toString());
        //errorMessage = errorResponse.errors?[0].message;
      }
      showCustomSnackBar(errorMessage, Get.context!);
    }
  }
}
