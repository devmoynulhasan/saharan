import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import '../../controller/account/about_us_controller.dart';


class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final PagesController controller = Get.put(PagesController());

    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF6F978).withOpacity(0.1),
                              spreadRadius: 7,
                            )
                          ],
                          shape: BoxShape.circle,
                          color: Color(0xFF053030),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xFFF6F978),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Privacy Policy",
                      style: GoogleFonts.orbitron(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 34),

            // ✅ API থেকে privacy_policy দেখাবে
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
                return Text(
                  controller.privacyPolicy.value,
                  style: TextStyle(
                    color: Color(0xFFEEEEF0),
                    fontSize: 16,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}