
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
      Get.snackbar('Error', 'Please enter current password',
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
        colorText: Colors.white,
      //  icon: const Icon(Icons.error, color: Colors.white),
      );
      return;
    }
    if (newPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter new password',
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
        colorText: Colors.white,
        //icon: const Icon(Icons.error, color: Colors.white),
      );
      return;
    }
    if (confirmPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please confirm password',
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
        colorText: Colors.white,
        //icon: const Icon(Icons.error, color: Colors.white),
      );
      return;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match',
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
        colorText: Colors.white,
        //icon: const Icon(Icons.error, color: Colors.white),
      );
      return;
    }

    // Success
    Get.snackbar('Success', 'Password changed successfully',
      backgroundColor: const Color(0xFFF6F978).withOpacity(0.9),
      colorText: const Color(0xFF0A3D3E),
     // icon: const Icon(Icons.check_circle, color: Color(0xFF0A3D3E)),
    );
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

