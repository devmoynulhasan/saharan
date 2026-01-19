
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AccountChangePasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isCurrentPasswordVisible = false.obs;
  final isNewPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  void toggleCurrentPasswordVisibility() {
    isCurrentPasswordVisible.value = !isCurrentPasswordVisible.value;
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void saveChanges() {
    if (currentPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter current password');
      return;
    }
    if (newPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter new password');
      return;
    }
    if (confirmPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please confirm password');
      return;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    // Add your password change API call here
    Get.snackbar('Success', 'Password changed successfully');
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

