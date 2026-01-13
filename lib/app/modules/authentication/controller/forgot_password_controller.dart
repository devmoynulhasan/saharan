import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/screen/forgot_verify_account.dart';

class ForgotPasswordController extends GetxController {
  var isEmailSelected = true.obs;

  // Text editing controllers
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  void selectEmail() {
    isEmailSelected.value = true;
  }

  void selectPhone() {
    isEmailSelected.value = false;
  }

  // Validate and continue
  void continueToOTP() {
    String value = isEmailSelected.value
        ? emailController.text.trim()
        : phoneController.text.trim();

    if (value.isEmpty) {
      Get.snackbar(
        'Error',
        isEmailSelected.value
            ? 'Please enter your email address'
            : 'Please enter your phone number',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    // Basic email validation
    if (isEmailSelected.value && !GetUtils.isEmail(value)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    // Basic phone validation
    if (!isEmailSelected.value && value.length < 10) {
      Get.snackbar(
        'Error',
        'Please enter a valid phone number',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    // Navigate to OTP screen
    Get.to(() => ForgotVerifyAccount(), arguments: {
      'type': isEmailSelected.value ? 'email' : 'phone',
      'value': value,
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}