import 'package:get/get.dart';

import '../controller/sign_up_conform_password_controller.dart';

class SinUpConformPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpConformPasswordController>(() => SignUpConformPasswordController());
  }

}