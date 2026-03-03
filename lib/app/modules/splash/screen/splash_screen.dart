import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/resource/app_images/app_images.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A3D3E),
              Color(0xFF032526),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Center(
              child: Image.asset(
                AssetPaths.splash_image_one,
                height: 98,
                width: 98,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Image.asset(
                AssetPaths.splash_image_two,
                width: 240,
                height: 28,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}