import 'package:get/get.dart';

import '../controller/forgot_varify_acount_controller.dart';

class ForgotVarifyBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ForgotOtpController>(() => ForgotOtpController());
  }

}