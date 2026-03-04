import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saharan/app/data/utilitis/custom_snackbar.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_varify_otp.dart';

import '../../../data/app_const/app_const.dart';
import '../../../data/local_storage/local_storage.dart';
import '../../../data/network/base_client.dart';
import '../../../data/network/ent_point.dart';

class AuthenticationController extends GetxController {
  var isLoading = false.obs;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController resetEmailController= TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();

  Future<void> createUser() async {
    isLoading.value = true;
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        "email": emailController.text
      };

      final response = await BaseClient.postRequest(
        api: EndPoint.createUserURL,
        body: body,
        headers: header,
      );

      if (response.statusCode == 200 || response.statusCode == 201 ) {
        final data = jsonDecode(response.body);
        print(data);

        var varificationToken = data['data']['verifyEmailToken'];
        debugPrint('varificationToken: $varificationToken');

        LocalStorage.saveData(key: AppConst.signUpVarificationToken, data: varificationToken);
        showCustomSnackBar(message:'Account created successfully! Please verify your email' );
        Get.to(() => SignUpVarifyOtp(email: emailController.text));
      } else {
        showCustomSnackBar(message: 'Account creation failed');
        debugPrint('Account creation failed');
      }
    } catch (e) {
      debugPrint('Account creation error: $e');
      showCustomSnackBar(message:'account creation failed $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword() async {
    isLoading.value = true;
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        "email": resetEmailController.text,
        "password": resetPasswordController.text
      };

      final response = await BaseClient.postRequest(
        api: EndPoint.createUserURL,
        body: body,
        headers: header,
      );

      if (response.statusCode == 200 || response.statusCode == 201 ) {
        final data = jsonDecode(response.body);
        print(data);

        var varificationToken = data['data']['verifyEmailToken'];
        debugPrint('varificationToken: $varificationToken');

        LocalStorage.saveData(key: AppConst.signUpVarificationToken, data: varificationToken);
        showCustomSnackBar(message:'Account created successfully! Please verify your email' );
        Get.to(() => SignUpVarifyOtp(email: emailController.text));
      } else {
        showCustomSnackBar(message: 'Account creation failed');
        debugPrint('Account creation failed');
      }
    } catch (e) {
      debugPrint('Account creation error: $e');
      showCustomSnackBar(message:'account creation failed $e');
    } finally {
      isLoading.value = false;
    }
  }

}