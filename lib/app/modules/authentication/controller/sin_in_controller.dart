
import 'package:get/get.dart';

class SignInController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe(){
    rememberMe.value = !rememberMe.value;

  }

}