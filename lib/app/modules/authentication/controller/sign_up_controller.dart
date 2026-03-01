import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_varify_otp.dart';

class SignUPController extends GetxController {
  var isLoading = false.obs;

  final emailController = TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  void onContinue() {
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

    // ✅ শুধু একটি Get.to() রাখুন এবং email pass করুন
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1), () {
      isLoading.value = false;
      Get.to(() => SignUpVarifyOtp(email: email));
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}