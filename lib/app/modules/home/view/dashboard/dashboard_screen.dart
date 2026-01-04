import 'package:flutter/material.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // App Bar Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo and Text
                    Row(
                      children: [
                        Image.asset(
                          AssetPaths.splash_image_one,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(width: 10),
                        Image.asset(
                          AssetPaths.splash_image_two,
                          height: 40,
                          width: 140,
                        ),
                      ],
                    ),
                    // Notification Icon
                    GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
