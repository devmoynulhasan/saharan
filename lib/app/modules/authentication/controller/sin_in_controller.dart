import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = false.obs;

  // Public controllers (underscore সরিয়ে দিন)
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      // Sign in logic here
      String email = emailTEController.text;
      String password = passwordTEController.text;
      bool remember = rememberMe.value;

      print('Email: $email');
      print('Password: $password');
      print('Remember Me: $remember');

      // API call বা authentication logic এখানে
    }
  }

  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }
}

