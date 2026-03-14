import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:saharan/app/data/utilitis/custom_snackbar.dart';
import '../../../data/app_const/app_const.dart';
import '../../../data/local_storage/local_storage.dart';
import '../../../data/network/base_client.dart';
import '../../../data/network/ent_point.dart';
import '../screen/sin_in_screen.dart';

class SignUpProfilePhotoController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);
  var isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  final String userId;
  SignUpProfilePhotoController({required this.userId});

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      showCustomSnackBar(message: 'Failed to pick image: $e');
    }
  }

  void removeImage() {
    selectedImage.value = null;
  }

  Future<void> uploadProfilePhoto() async {
    if (selectedImage.value == null) {
      showCustomSnackBar(message: 'Please select a photo first');
      return;
    }

    isLoading.value = true;

    try {
      // ✅ email LocalStorage থেকে নাও
      final email = LocalStorage.getData(key: AppConst.userEmail);

      debugPrint('userId for photo upload: $userId');
      debugPrint('email for photo upload: $email');

      final imageFile = await http.MultipartFile.fromPath(
        'images',
        selectedImage.value!.path,
      );

      final response = await BaseClient.putMultipartRequest(
        api: EndPoint.uploadProfilePhotoURL,
        files: [imageFile],
        fields: {
          'id': userId,
          'email': email ?? '', // ✅ email যোগ করা হয়েছে
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSnackBar(message: 'Profile updated successfully!');
        Get.offAll(() => SinInScreen());
      } else {
        showCustomSnackBar(message: 'Upload failed. Try again.');
        debugPrint('Upload failed: ${response.body}');
      }
    } catch (e) {
      debugPrint('Upload error: $e');
      showCustomSnackBar(message: 'Upload error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}