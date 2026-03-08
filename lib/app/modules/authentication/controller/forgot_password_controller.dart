import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/data/network/base_client.dart';
import 'package:saharan/app/data/network/ent_point.dart';
import 'package:saharan/app/data/utilitis/custom_snackbar.dart' hide SnackPosition;
import 'package:saharan/app/modules/authentication/screen/forgot_verify_account.dart';
import '../../../data/app_const/app_const.dart';
import '../../../data/local_storage/local_storage.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;
  final emailController = TextEditingController();

  Future<void> continueToOTP() async {
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

    await createForgetPasswordUser();
  }

  Future<void> createForgetPasswordUser() async {
    isLoading.value = true;
    try {
      final response = await BaseClient.postRequest(
        api: EndPoint.forgotPasswordURL,
        body: {"email": emailController.text.trim()},
        headers: {'Content-Type': 'application/json'},
      );

      debugPrint('StatusCode: ${response.statusCode}');
      debugPrint('Response: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        LocalStorage.saveData(
          key: AppConst.forgotToken,
          data: emailController.text.trim(),
        );

        // ✅ আগে navigate, তারপর snackbar
        Get.to(() => ForgotVerifyAccount(email: emailController.text.trim()));
        showCustomSnackBar(message: 'OTP sent to your email!');
      } else {
        showCustomSnackBar(
          message: data['message'] ?? 'Failed to send OTP',
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