

import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/controller/sin_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());

  }
}
