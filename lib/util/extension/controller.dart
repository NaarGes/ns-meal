import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_meal/config/theme/colors.dart';
import 'package:ns_meal/util/strings.dart';

extension ControllerX on GetxController {
  void showSnackBar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
        messageText: Text(
          message,
          style: const TextStyle(color: Palette.white),
        ),
      ),
    );
  }

  showErrorSnackBar(String? message) {
    // TODO style it
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
        messageText: Text(
          message ?? Strings.emptyString,
          style: const TextStyle(color: Palette.white),
        ),
      ),
    );
  }

  showSucceedSnackBar(String? message) {
    // TODO style it
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
        messageText: Text(
          message ?? Strings.emptyString,
          style: const TextStyle(color: Palette.white),
        ),
      ),
    );
  }
}
