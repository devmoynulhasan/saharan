import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:saharan/app/data/app_const/app_const.dart';
import 'package:saharan/app/data/local_storage/local_storage.dart';
import 'package:saharan/app/data/network/ent_point.dart';

class AccountController extends GetxController {
  Rx<File?> pickedImage = Rx<File?>(null);

  RxString profileImageUrl = ''.obs;
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;
    try {
      final token = LocalStorage.getData(key: AppConst.accessToken);

      final response = await http.get(
        Uri.parse(EndPoint.userProfile), // e.g. baseUrl + '/api/v1/auth/user'
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final user = data['data'];
        final first = user['firstName'] ?? '';
        final last = user['lastName'] ?? '';
        userName.value = '$first $last'.trim();
        userEmail.value = user['email'] ?? '';
        profileImageUrl.value = user['imageUrl'] ?? '';
      }
    } catch (e) {
      print('Error fetching profile: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }
}