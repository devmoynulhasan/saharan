import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/data/app_const/app_const.dart';
import 'package:saharan/app/data/local_storage/local_storage.dart';
import 'package:saharan/app/data/network/base_client.dart';
import 'package:saharan/app/data/network/ent_point.dart';
import 'package:saharan/app/data/utilitis/custom_snackbar.dart' hide SnackPosition;
import 'package:saharan/app/modules/authentication/screen/forgot_verify_account.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs; // ✅ ঠিক করা হয়েছে
  final emailController = TextEditingController();

  Future<void> continueToOTP() async { // ✅ async করা হয়েছে
    String email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        'Error', 'Please enter your email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Error', 'Please enter a valid email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    await createForgetPasswordUser(); // ✅ API call করো
  }

  Future<void> createForgetPasswordUser() async {
    isLoading.value = true;
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        "email": emailController.text.trim(),
      };

      debugPrint('Forgot password email: ${emailController.text}');

      final response = await BaseClient.postRequest(
        api: EndPoint.forgotPasswordURL, // ✅ সঠিক endpoint
        body: body,
        headers: header,
      );

      debugPrint('StatusCode: ${response.statusCode}');
      debugPrint('Response: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // ✅ data নেই তাই token save করার দরকার নেই
        showCustomSnackBar(message: 'OTP sent to your email!');
        Get.to(() => ForgotVerifyAccount(email: emailController.text.trim()));
      } else {
        final errorData = jsonDecode(response.body);
        showCustomSnackBar(
          message: errorData['message'] ?? 'Failed to send OTP',
        );
      }
    } catch (e) {
      debugPrint('forgot password error: $e');
      showCustomSnackBar(message: 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}