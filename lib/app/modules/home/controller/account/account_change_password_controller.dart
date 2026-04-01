import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// তোমার প্রজেক্টের import গুলো ঠিকমতো রাখো
// import 'package:saharan/app/core/network/base_client.dart';
// import 'package:saharan/app/core/constants/end_point.dart';
// import 'package:saharan/app/core/utils/custom_snackbar.dart';

import '../../../../data/network/base_client.dart';
import '../../../../data/network/ent_point.dart';

class AccountChangePasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isCurrentPasswordVisible = false.obs;
  final isNewPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isLoading = false.obs; // ✅ add করা হয়েছে

  void toggleCurrentPasswordVisibility() {
    isCurrentPasswordVisible.value = !isCurrentPasswordVisible.value;
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  bool validatePasswords() {
    if (currentPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter current password',
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
        colorText: Colors.white,
      );
      return false;
    }
    if (newPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter new password',
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
        colorText: Colors.white,
      );
      return false;
    }
    if (confirmPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please confirm password',
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
        colorText: Colors.white,
      );
      return false;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match',
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  // ✅ Save button এখন এই method কে call করবে
  void saveChanges() => changePassword();

  Future<void> changePassword() async {
    if (!validatePasswords()) return;

    try {
      isLoading.value = true;

      Map<String, String> header = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "newPassword": newPasswordController.text,   // ✅ fix
        "oldPassword": currentPasswordController.text, // ✅ fix
      };

      final response = await BaseClient.postRequest(
        api: EndPoint.changePassword, // ✅ signup endpoint সরিয়ে change-password দাও
        body: body,
        headers: header,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // ✅ fields clear করো
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();

        Get.snackbar(
          'Success',
          'Password changed successfully',
          backgroundColor: const Color(0xFFF6F978).withOpacity(0.9),
          colorText: const Color(0xFF0A3D3E),
        );
      } else {
        final errorData = jsonDecode(response.body);
        Get.snackbar(
          'Error',
          errorData['message'] ?? 'Password change failed',
          backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint('change password error: $e');
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}