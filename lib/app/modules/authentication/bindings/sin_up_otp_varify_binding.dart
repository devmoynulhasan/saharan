import 'package:get/get.dart';

import '../controller/sin_up_otp_verify_controller.dart';

class SinUpOtpVarifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpVerifyController>(() => OtpVerifyController(email: ''));
  }

}