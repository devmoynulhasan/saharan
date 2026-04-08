import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../../resource/app_images/app_images.dart' show AssetPaths;
import '../../../../data/app_const/app_const.dart' show AppConst;
import '../../../../data/local_storage/local_storage.dart';
import '../../../../data/network/ent_point.dart';
import '../../../home/view/home_screen.dart';
import 'googlesigninservice.dart';

class FairvaseGoogleSigin extends StatelessWidget {
  FairvaseGoogleSigin({super.key});

  final RxBool _isLoading = false.obs;
  final _storage = GetStorage();

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    _isLoading.value = true;

    try {
      final user = await GoogleSignInService.signInWithGoogle();

      if (user == null) {
        print("❌ Google Sign-In বাতিল হয়েছে");
        return;
      }

      final nameParts = (user.displayName ?? '').split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : '';
      final lastName =
      nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      final response = await http.post(
        Uri.parse(EndPoint.googleSignIn),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": user.email,
          "imageUrl": user.photoURL,
          "firstName": firstName,
          "lastName": lastName,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        print("✅ Response Data: $responseData");
        print("✅ Full body: ${response.body}"); // token key দেখো

        LocalStorage.saveData(key: AppConst.accessToken, data: responseData['token']);
        LocalStorage.saveData(key: 'user_email', data: user.email);
        LocalStorage.saveData(key: 'user_firstName', data: firstName);
        LocalStorage.saveData(key: 'user_lastName', data: lastName);
        LocalStorage.saveData(key: 'user_image', data: user.photoURL);

        Get.offAll(() => const HomeScreen());
      } else {
        print("❌ API Error: ${response.statusCode}");
        print("❌ Response Body: ${response.body}");
      }
    } catch (e) {
      print("❌ Error: $e");
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GestureDetector(
        onTap:
        _isLoading.value ? null : () => _handleGoogleSignIn(context),
        child: Container(
          height: 52,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF0A3D3E),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: Center(
            child: _isLoading.value
                ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5,
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetPaths.google,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 15),
                const Text(
                  "Continue with Google",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}