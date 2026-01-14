import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/screen/sin_up_conform_password.dart';

class OtpVerifyController extends GetxController {
  final otpController = TextEditingController();
  var isLoading = false.obs;
  var otpCode = ''.obs;
  var isOtpComplete = false.obs;

  // Timer for resend OTP
  var canResend = false.obs;
  var resendTimer = 60.obs;

  @override
  void onInit() {
    super.onInit();
    startResendTimer();
  }

  // Start countdown timer for resend
  void startResendTimer() {
    canResend.value = false;
    resendTimer.value = 60;

    Future.delayed(Duration(seconds: 1), () {
      _decrementTimer();
    });
  }

  void _decrementTimer() {
    if (resendTimer.value > 0) {
      resendTimer.value--;
      Future.delayed(Duration(seconds: 1), () {
        _decrementTimer();
      });
    } else {
      canResend.value = true;
    }
  }

  // OTP input change
  void onOtpChanged(String value) {
    otpCode.value = value;
    isOtpComplete.value = value.length == 6;

    // Auto verify when 6 digits entered
    if (value.length == 6) {
      verifyOtp();
    }
  }

  // Verify OTP
  void verifyOtp() {
    if (otpCode.value.length != 6) {
      Get.snackbar(
        'Error',
        'Please enter 6-digit OTP code',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFFF6B6B),
        colorText: Colors.white,
        margin: EdgeInsets.all(16),
        borderRadius: 12,
        duration: Duration(seconds: 2),
      );
      return;
    }

    isLoading.value = true;

    // Simulate API call to verify OTP
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;

      // Check if OTP is correct (for demo, any 6 digits will work)
      // In real app, you would verify with backend
      if (otpCode.value.length == 6) {
        Get.snackbar(
          'Success',
          'OTP verified successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF4CAF50),
          colorText: Colors.white,
          margin: EdgeInsets.all(16),
          borderRadius: 12,
          duration: Duration(seconds: 2),
        );

        // Navigate to password screen
        Future.delayed(Duration(milliseconds: 500), () {
          Get.to(() => SinUpConformPassword());
        });
      } else {
        Get.snackbar(
          'Invalid OTP',
          'The OTP you entered is incorrect',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFFFF6B6B),
          colorText: Colors.white,
          margin: EdgeInsets.all(16),
          borderRadius: 12,
          duration: Duration(seconds: 2),
        );
      }
    });
  }

  // Resend OTP
  void resendOtp() {
    if (!canResend.value) {
      Get.snackbar(
        'Please Wait',
        'You can resend OTP after ${resendTimer.value} seconds',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFFF9800),
        colorText: Colors.white,
        margin: EdgeInsets.all(16),
        borderRadius: 12,
        duration: Duration(seconds: 2),
      );
      return;
    }

    isLoading.value = true;

    // Simulate resend OTP API call
    Future.delayed(Duration(seconds: 1), () {
      isLoading.value = false;

      Get.snackbar(
        'OTP Sent',
        'A new OTP has been sent to your email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFF4CAF50),
        colorText: Colors.white,
        margin: EdgeInsets.all(16),
        borderRadius: 12,
        duration: Duration(seconds: 2),
      );

      // Reset OTP field
      otpController.clear();
      otpCode.value = '';
      isOtpComplete.value = false;

      // Restart timer
      startResendTimer();
    });
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}