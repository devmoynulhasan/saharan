import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:saharan/app/routes/app_routes.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  bool? isLoggedIn;
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _navigateAfterDelay();
  }

  void _navigateAfterDelay() {
    Future.delayed(const Duration(seconds: 2), () {
      if (isLoggedIn == null) {
        Get.toNamed(AppRoutes.SININSCREEN);
      } else {
        // Get.toNamed(AppRoutes.HOMESCREEN);
      }
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}