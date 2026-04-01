import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide SnackPosition;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../../data/app_const/app_const.dart';
import '../../../../data/local_storage/local_storage.dart';
import '../../../../data/network/ent_point.dart';
import '../../../../data/utilitis/custom_snackbar.dart';
import 'account_screen_controller.dart'; // ✅ import

class PersonalInfoController extends GetxController {
  var selectedImage = Rx<File?>(null);
  RxString networkImageUrl = ''.obs;
  RxString userEmail = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isSaving = false.obs;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _loadFromAccountController(); // ✅ API call না করে AccountController থেকে নাও
  }

  // ─────────────────────────────────────────
  // AccountController থেকে existing data নাও
  // (screen open হলে API double call হবে না)
  // ─────────────────────────────────────────
  void _loadFromAccountController() {
    try {
      final accountController = Get.find<AccountController>();
      final fullName = accountController.userName.value.trim();
      final parts = fullName.split(' ');
      firstNameController.text = parts.isNotEmpty ? parts.first : '';
      lastNameController.text  = parts.length > 1 ? parts.sublist(1).join(' ') : '';
      userEmail.value          = accountController.userEmail.value;
      networkImageUrl.value    = accountController.profileImageUrl.value;
    } catch (_) {
      // AccountController না পেলে API থেকে নাও
      fetchUserProfile();
    }
  }

  // ─────────────────────────────────────────
  // GET /api/v1/auth/user (fallback)
  // ─────────────────────────────────────────
  Future<void> fetchUserProfile() async {
    isLoading.value = true;
    try {
      final token = LocalStorage.getData(key: AppConst.accessToken);

      final response = await http.get(
        Uri.parse(EndPoint.userProfile),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final user = data['data'];
        firstNameController.text = user['firstName'] ?? '';
        lastNameController.text  = user['lastName']  ?? '';
        userEmail.value          = user['email']     ?? '';
        networkImageUrl.value    = user['imageUrl']  ?? '';
      } else {
        showCustomSnackBar(
          message: data['message'] ?? 'Failed to load profile',
          type: SnackType.error,
        );
      }
    } catch (e) {
      debugPrint('fetchUserProfile error: $e');
      showCustomSnackBar(
        message: 'Could not load profile',
        type: SnackType.error,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // ─────────────────────────────────────────
  // PUT /api/v1/auth/update-profile (multipart form-data)
  // ─────────────────────────────────────────
  Future<void> saveProfile() async {
    final firstName = firstNameController.text.trim();
    final lastName  = lastNameController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty) {
      showCustomSnackBar(
        message: 'Please fill in all fields',
        type: SnackType.error,
      );
      return;
    }

    isSaving.value = true;
    try {
      final token = LocalStorage.getData(key: AppConst.accessToken);

      final request = http.MultipartRequest(
        'PUT',
        Uri.parse(EndPoint.uploadProfilePhotoURL),
      );

      request.headers['Authorization'] = token ?? '';

      request.fields['data'] = jsonEncode({
        "firstName": firstName,
        "lastName" : lastName,
        "email"    : userEmail.value,
      });

      if (selectedImage.value != null) {
        final multipartFile = await http.MultipartFile.fromPath(
          'images',
          selectedImage.value!.path,
        );
        request.files.add(multipartFile);
      }

      final streamedResponse = await request.send();
      final response         = await http.Response.fromStream(streamedResponse);
      final responseData     = jsonDecode(response.body);

      debugPrint('StatusCode: ${response.statusCode}');
      debugPrint('Response  : ${response.body}');

      if (response.statusCode == 200 && responseData['success'] == true) {
        final user = responseData['data'];

        final updatedFirst = user['firstName'] ?? firstName;
        final updatedLast  = user['lastName']  ?? lastName;
        final updatedImage = user['imageUrl']  ?? '';

        // ─── PersonalInfoController নিজে update ───
        firstNameController.text = updatedFirst;
        lastNameController.text  = updatedLast;
        if (updatedImage.isNotEmpty) {
          networkImageUrl.value = updatedImage;
          selectedImage.value   = null;
        }

        // ─── ✅ AccountController real-time sync ───
        try {
          final accountController = Get.find<AccountController>();
          accountController.userName.value       = '$updatedFirst $updatedLast'.trim();
          accountController.profileImageUrl.value = updatedImage.isNotEmpty
              ? updatedImage
              : accountController.profileImageUrl.value;
          if (selectedImage.value != null) {
            accountController.pickedImage.value = selectedImage.value;
          } else {
            accountController.pickedImage.value = null;
          }
        } catch (_) {
          // AccountController না থাকলে ignore
        }

        showCustomSnackBar(
          message: 'Profile updated successfully',
          type: SnackType.success,
        );
      } else {
        showCustomSnackBar(
          message: responseData['message'] ?? 'Update failed',
          type: SnackType.error,
        );
      }
    } catch (e) {
      debugPrint('saveProfile error: $e');
      showCustomSnackBar(
        message: 'Something went wrong',
        type: SnackType.error,
      );
    } finally {
      isSaving.value = false;
    }
  }

  // ─── Image Picker ───
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void removeImage() {
    selectedImage.value = null;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}