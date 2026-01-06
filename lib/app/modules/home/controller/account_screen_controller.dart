import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  Rx<File?> pickedImage = Rx<File?>(null);

  // Asset path (যদি file থাকে)
  RxString profileImage = 'assets/images/profile_image.png'.obs;

  RxString userName = 'User Name'.obs;
  RxString userEmail = 'user@email.com'.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }
}