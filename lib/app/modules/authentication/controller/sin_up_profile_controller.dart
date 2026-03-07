import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saharan/app/data/app_const/app_const.dart';
import 'package:saharan/app/data/local_storage/local_storage.dart';
import 'package:saharan/app/data/network/ent_point.dart';
import 'package:saharan/app/data/utilitis/custom_snackbar.dart' hide SnackPosition;
import '../screen/sign_up_profile_photo.dart';

class SignUpProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  var isLoading = false.obs;

  bool validateProfile() {
    if (firstNameController.text.trim().isEmpty) {
      Get.snackbar(
        'Error', 'Please enter your first name',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (firstNameController.text.trim().length < 2) {
      Get.snackbar(
        'Error', 'First name must be at least 2 characters',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (lastNameController.text.trim().isEmpty) {
      Get.snackbar(
        'Error', 'Please enter your last name',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (lastNameController.text.trim().length < 2) {
      Get.snackbar(
        'Error', 'Last name must be at least 2 characters',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }

  Future<void> singUpProfile() async {
    if (!validateProfile()) return;

    try {
      isLoading.value = true;

      final accessToken = LocalStorage.getData(key: AppConst.accessToken);
      final email = LocalStorage.getData(key: AppConst.userEmail); // ✅ email LocalStorage থেকে

      debugPrint('accessToken: $accessToken');
      debugPrint('email: $email');
      debugPrint('firstName: ${firstNameController.text}');
      debugPrint('lastName: ${lastNameController.text}');

      // ✅ form-data multipart request
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(EndPoint.singUpProfile),
      );

      // ✅ Authorization header
      request.headers['Authorization'] = 'Bearer $accessToken';

      // ✅ data field এ email সহ JSON
      request.fields['data'] = jsonEncode({
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "email": email ?? '',
      });

      debugPrint('Sending data: ${request.fields['data']}');

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      debugPrint('StatusCode: ${response.statusCode}');
      debugPrint('Response: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSnackBar(message: 'Profile saved!');
        Get.off(() => SignUpProfilePhoto());
      } else {
        final errorData = jsonDecode(response.body);
        showCustomSnackBar(
          message: errorData['message'] ?? 'Profile update failed',
        );
      }
    } catch (e) {
      debugPrint('profile error: $e');
      Get.snackbar(
        'Error', 'Profile update failed: $e',
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
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}