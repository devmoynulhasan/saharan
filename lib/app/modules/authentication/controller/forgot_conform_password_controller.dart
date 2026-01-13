import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';


class ForgotConformPasswordController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  // Text controllers
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Get OTP data from previous screen
  var otp = ''.obs;
  var contactType = ''.obs;
  var contactValue = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Get arguments from OTP screen
    final args = Get.arguments;
    if (args != null) {
      otp.value = args['otp'] ?? '';
      contactType.value = args['type'] ?? '';
      contactValue.value = args['value'] ?? '';
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void resetPassword() {
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // Validation checks
    if (password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your new password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
        margin: EdgeInsets.all(16),
      );
      return;
    }

    if (password.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 characters long',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
        margin: EdgeInsets.all(16),
      );
      return;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar(
        'Error',
        'Please confirm your password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
        margin: EdgeInsets.all(16),
      );
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
        margin: EdgeInsets.all(16),
      );
      return;
    }

    // If all validations pass, proceed with password reset
    // Here you can add your API call to reset password
    // For now, we'll show success message and navigate to sign in

    Get.snackbar(
      'Success',
      'Password reset successfully! Please sign in with your new password',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.7),
      colorText: Colors.white,
      margin: EdgeInsets.all(16),
      duration: Duration(seconds: 2),
    );

    // Navigate to sign in page after a short delay
    Future.delayed(Duration(seconds: 2), () {
      // Remove all previous routes and go to sign in
      Get.offAll(() => SinInScreen());
    });
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}