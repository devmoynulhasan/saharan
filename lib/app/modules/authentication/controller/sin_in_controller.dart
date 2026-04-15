import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saharan/app/data/utilitis/custom_snackbar.dart';
import 'package:saharan/app/modules/home/view/home_screen.dart';

import '../../../data/app_const/app_const.dart';
import '../../../data/local_storage/local_storage.dart';
import '../../../data/network/base_client.dart';
import '../../../data/network/ent_point.dart';

class SignInController extends GetxController {
  RxBool rememberMe = false.obs;
  var isLoading = false.obs;

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }



  Future<void> signIn() async {
    try {
      isLoading.value = true;

      Map<String, String> header = {
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        "email": emailTEController.text,
        "password": passwordTEController.text
      };

      final response = await BaseClient.postRequest(
        api: EndPoint.userLoginURL,
        body: body,
        headers: header,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        LocalStorage.saveData(key: AppConst.accessToken, data: data['data']['accessToken']);
        LocalStorage.saveData(key: AppConst.refreshToken, data: data['data']['refreshToken']);
        LocalStorage.saveData(key: AppConst.role, data: data['data']['role']);
        LocalStorage.saveData(key: 'user_email', data: emailTEController.text.trim());

        LocalStorage.saveData(key: 'user_firstName', data: '');
        LocalStorage.saveData(key: 'user_lastName', data: '');
        LocalStorage.saveData(key: 'user_image', data: '');

        Get.offAll(() => HomeScreen());
        showCustomSnackBar(message: 'Login success...');
      }
    } catch (e) {
      debugPrint('login error: $e');
      Get.rawSnackbar(message: 'login failed $e');
    } finally {
      isLoading.value = false; // ✅ শেষে false
    }
  }
}

