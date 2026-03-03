import 'package:get/get.dart';

import '../controller/sign_up_profile_photo_controller.dart';

class SinUpProfilePhotoBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut<SignUpProfilePhotoController>(() => SignUpProfilePhotoController());
  }

}