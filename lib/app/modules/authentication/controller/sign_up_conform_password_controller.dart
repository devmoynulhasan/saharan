import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/data/app_const/app_const.dart';
import 'package:saharan/app/data/local_storage/local_storage.dart';
import 'package:saharan/app/data/network/base_client.dart';
import 'package:saharan/app/data/network/ent_point.dart';
import 'package:saharan/app/data/utilitis/custom_snackbar.dart' hide SnackPosition;
import '../screen/sign_up_profile.dart';

class SignUpConformPasswordController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;

  final String email;
  SignUpConformPasswordController({required this.email});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  bool validatePasswords() {
    if (passwordController.text.isEmpty) {
      Get.snackbar(
        'Error', 'Please enter a password',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (passwordController.text.length < 6) {
      Get.snackbar(
        'Error', 'Password must be at least 6 characters',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error', 'Please confirm your password',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Error', 'Passwords do not match',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }

  Future<void> singUpConformPassword() async {
    if (!validatePasswords()) return;

    try {
      isLoading.value = true;

      debugPrint('Email being sent: $email'); // ✅ debug করার জন্য

      Map<String, String> header = {
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        "email": email,
        "password": passwordController.text,
      };

      final response = await BaseClient.postRequest(
        api: EndPoint.sinUpConformPassword,
        body: body,
        headers: header,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        var accessToken = data['data']['user']['accessToken'];
        debugPrint('accessToken: $accessToken');

        LocalStorage.saveData(key: AppConst.accessToken, data: accessToken);
        showCustomSnackBar(message: 'Sign up success!');
        Get.off(() => SignUpProfile());
      } else {
        showCustomSnackBar(message: 'Sign up failed...');
        debugPrint('sign up failed: ${response.body}');
      }
    } catch (e) {
      debugPrint('sign up error: $e');
      Get.rawSnackbar(message: 'Sign up failed: $e');
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