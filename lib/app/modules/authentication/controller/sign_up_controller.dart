import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_varify_otp.dart';

class SignUPController extends GetxController {
  var isEmailSelected = true.obs;
  var isLoading = false.obs;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  void selectEmail() {
    isEmailSelected.value = true;
  }

  void selectPhone() {
    isEmailSelected.value = false;
  }

  // Email validation
  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  // Phone validation (Bangladesh format: 11 digits)
  bool isValidPhone(String phone) {
    // Remove any spaces or special characters
    String cleanPhone = phone.replaceAll(RegExp(r'[^0-9]'), '');

    // Check if it's 11 digits and starts with 01
    return cleanPhone.length == 11 && cleanPhone.startsWith('01');
  }

  // Continue button action
  void onContinue() {
    if (isEmailSelected.value) {
      // Email validation
      String email = emailController.text.trim();

      if (email.isEmpty) {
        Get.snackbar(
          'Error',
          'Please enter your email address',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFFFF6B6B),
          colorText: Color(0xFFFFFFFF),
          margin: EdgeInsets.all(16),
          borderRadius: 12,
          duration: Duration(seconds: 3),
        );
        return;
      }

      if (!isValidEmail(email)) {
        Get.snackbar(
          'Invalid Email',
          'Please enter a valid email address',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFFFF6B6B),
          colorText: Color(0xFFFFFFFF),
          margin: EdgeInsets.all(16),
          borderRadius: 12,
          duration: Duration(seconds: 3),
        );
        return;
      }

      // Email valid - proceed to OTP
      isLoading.value = true;
      // Simulate API call
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
        Get.to(() => SignUpVarifyOtp());
      });

    } else {
      // Phone validation
      String phone = phoneController.text.trim();

      if (phone.isEmpty) {
        Get.snackbar(
          'Error',
          'Please enter your phone number',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFFFF6B6B),
          colorText: Color(0xFFFFFFFF),
          margin: EdgeInsets.all(16),
          borderRadius: 12,
          duration: Duration(seconds: 3),
        );
        return;
      }

      if (!isValidPhone(phone)) {
        Get.snackbar(
          'Invalid Phone',
          'Please enter a valid 11-digit phone number (e.g., 01XXXXXXXXX)',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFFFF6B6B),
          colorText: Color(0xFFFFFFFF),
          margin: EdgeInsets.all(16),
          borderRadius: 12,
          duration: Duration(seconds: 3),
        );
        return;
      }

      // Phone valid - proceed to OTP
      isLoading.value = true;
      // Simulate API call
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
        Get.to(() => SignUpVarifyOtp());
      });
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}