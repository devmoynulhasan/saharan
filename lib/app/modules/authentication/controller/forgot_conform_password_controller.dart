import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saharan/app/data/app_const/app_const.dart';
import 'package:saharan/app/data/local_storage/local_storage.dart';
import 'package:saharan/app/data/network/ent_point.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';

class ForgotConformPasswordController extends GetxController {
  final String email; // ✅ email যোগ করা হয়েছে
  ForgotConformPasswordController({required this.email});

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs; // ✅ loading যোগ করা হয়েছে

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> resetPassword() async {
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // ✅ Validation
    if (password.isEmpty) {
      Get.snackbar('Error', 'Please enter your new password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
      return;
    }
    if (password.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters long',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
      return;
    }
    if (confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Please confirm your password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
      return;
    }

    // ✅ API call
    isLoading.value = true;
    try {
      final resetToken = LocalStorage.getData(key: AppConst.resetToken);

      final response = await http.post(
        Uri.parse(EndPoint.forgotConformPasswordURL),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': resetToken ?? '',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 && responseBody['success'] == true) {
        LocalStorage.removeData(key: AppConst.resetToken); // ✅ token মুছে দাও
        // ✅ আগে navigate, পরে snackbar
        Get.offAll(() => SinInScreen());
        Get.snackbar('Success', 'Password reset successfully!',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
      } else {
        Get.snackbar(
            'Error', responseBody['message'] ?? 'Failed to reset password',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}