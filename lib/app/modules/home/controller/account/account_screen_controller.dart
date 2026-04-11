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
    _loadFromLocalFirst();
    fetchUserProfile();
  }

  void _loadFromLocalFirst() {
    final firstName = LocalStorage.getData(key: 'user_firstName') ?? '';
    final lastName = LocalStorage.getData(key: 'user_lastName') ?? '';
    final email = LocalStorage.getData(key: 'user_email') ?? '';
    final image = LocalStorage.getData(key: 'user_image') ?? '';

    if (firstName.isNotEmpty || email.isNotEmpty) {
      userName.value = '$firstName $lastName'.trim();
      userEmail.value = email;
      profileImageUrl.value = image;
    }
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;
    try {
      final token = LocalStorage.getData(key: AppConst.accessToken);

      if (token == null || token.isEmpty) {
        print('⚠️ Token নেই, API call বাদ দেওয়া হচ্ছে');
        return;
      }

      final response = await http.get(
        Uri.parse(EndPoint.userProfile),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token, // ✅ Bearer ছাড়া
        },
      );

      print('📦 Profile API Status: ${response.statusCode}');
      print('📦 Profile API Body: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final user = data['data'];
        final first = user['firstName'] ?? '';
        final last = user['lastName'] ?? ''; // API তে না থাকলে empty হবে

        userName.value = '$first $last'.trim();
        userEmail.value = user['email'] ?? '';
        profileImageUrl.value = user['imageUrl'] ?? '';

        // ✅ Local storage update করো
        LocalStorage.saveData(key: 'user_firstName', data: first);
        LocalStorage.saveData(key: 'user_lastName', data: last);
        LocalStorage.saveData(key: 'user_email', data: user['email'] ?? '');
        LocalStorage.saveData(key: 'user_image', data: user['imageUrl'] ?? '');

        print('✅ Profile loaded: ${userName.value}');
      } else {
        print('❌ Profile API Error: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error fetching profile: $e');
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