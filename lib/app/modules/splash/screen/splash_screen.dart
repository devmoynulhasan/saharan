import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/routes/app_routes.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool? isLoggedIn;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    // Check login status here
    // isLoggedIn = await checkLoginStatus();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return; // Check if widget is still mounted

      if (isLoggedIn == null) {
        Get.toNamed(AppRoutes.SININSCREEN);
      } else {
        // Navigate to home screen
        // Get.toNamed(AppRoutes.HOMESCREEN);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
            end: Alignment.bottomCenter
          ),
        ),
        child:Column(
          children: [
            const Spacer(flex: 2,),
            Center(
              child: Image.asset(
                AssetPaths.splash_image_one,
                height: 98,
                width: 98,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Image.asset(
                AssetPaths.splash_image_two,
                width: 240,
                height: 28,
              ),
            ),
            const Spacer(flex: 2,),

          ],
        ),

      ),
    );
  }
}

