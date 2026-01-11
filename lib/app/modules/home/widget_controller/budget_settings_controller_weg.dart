import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class BudgetSettingsController extends GetxController {
  // Observable variables
  var isSwitchOn1 = false.obs;
  var isSwitchOn2 = false.obs;
  var selectedDay = 'Monday'.obs;

  // Methods
  void toggleSwitch1(bool value) {
    isSwitchOn1.value = value;
  }

  void toggleSwitch2(bool value) {
    isSwitchOn2.value = value;
  }

  void updateSelectedDay(String day) {
    selectedDay.value = day;
  }

  void saveSettings() {
    // Save logic here
    Get.back();
    Get.snackbar(
      'Success',
      'Settings saved successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xFFF6F978),
      colorText: Color(0xFF0A3D3E),
    );
  }
}