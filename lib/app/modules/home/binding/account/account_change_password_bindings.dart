

import 'package:get/get.dart';
import 'package:saharan/app/modules/home/controller/account/account_change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountChangePasswordController>(() => AccountChangePasswordController());
  }
}