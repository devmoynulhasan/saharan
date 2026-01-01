import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUPController>(() => SignUPController());

  }
}
