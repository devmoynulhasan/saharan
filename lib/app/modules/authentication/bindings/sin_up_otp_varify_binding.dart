import 'package:get/get.dart';

import '../controller/otp_verification_controller.dart';
import '../controller/sin_up_otp_verify_controller.dart';

class SinUpOtpVarifyBinding extends Bindings {
  @override

  void dependencies() {
    // Get.lazyPut<OtpVerifyController>(() => OtpVerifyController(email: ''));
    Get.lazyPut<OtpVerificationController>(() => OtpVerificationController(), fenix: true,);
  }

}