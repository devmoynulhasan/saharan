import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  // Use Rx<File?> for picked images and RxString for asset images
  Rx<File?> pickedImage = Rx<File?>(null);
  RxString profileImage = 'assets/profile_image.png'.obs;

  // User info
  RxString userName = 'Adam Smith'.obs;
  RxString userEmail = 'adam576@gmail.com'.obs;

  // Pick image from gallery or camera
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        pickedImage.value = File(pickedFile.path);
        print('Picked image: ${pickedFile.path}');
      }
    } catch (e) {
      print('Image pick failed: $e');
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}