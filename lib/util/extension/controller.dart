import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ns_meal/config/theme/colors.dart';

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

  showErrorToast(String message) {
    // TODO implement
  }

  showSucceedToast(String message) {
    // TODO implement
  }
}
