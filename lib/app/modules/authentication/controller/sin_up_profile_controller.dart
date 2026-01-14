import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  bool validateProfile() {
    if (firstNameController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your first name',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (firstNameController.text.trim().length < 2) {
      Get.snackbar(
        'Error',
        'First name must be at least 2 characters',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (lastNameController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your last name',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (lastNameController.text.trim().length < 2) {
      Get.snackbar(
        'Error',
        'Last name must be at least 2 characters',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}