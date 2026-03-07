import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/controller/sign_up_controller.dart';

import '../controller/authentication_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(() => AuthenticationController());

  }
}
