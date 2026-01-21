import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/screen/forgot_verify_account.dart';

class ForgotPasswordController extends GetxController {
  // Text editing controller
  final emailController = TextEditingController();

  // Validate and continue
  void continueToOTP() {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    // Email validation
    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    // Navigate to OTP screen
    Get.to(() => ForgotVerifyAccount(), arguments: {
      'type': 'email',
      'value': email,
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}