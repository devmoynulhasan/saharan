import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/sign_up_profile_photo_controller.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/authentication/widget/sign_up_profile_photo_weg.dart';

class SignUpProfilePhoto extends StatelessWidget {
  final String userId; // ✅ যোগ করা হয়েছে
  const SignUpProfilePhoto({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    // ✅ userId pass করা হয়েছে
    final SignUpProfilePhotoController controller = Get.put(
      SignUpProfilePhotoController(userId: userId),
    );

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Get.back(),
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
                SizedBox(height: 32),
                Text(
                  "Add a Profile Photo",
                  style: GoogleFonts.orbitron(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Upload a photo to personalize your profile",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 14,
                    color: Color(0xFFB2B3BD),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 60),
                Sign_Up_profile_Photo_Widget(controller: controller),
                Obx(() {
                  bool isEnabled = controller.selectedImage.value != null;
                  bool isLoading = controller.isLoading.value;

                  return GestureDetector(
                    onTap: isEnabled && !isLoading
                        ? () => controller.uploadProfilePhoto()
                        : null,
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: isEnabled
                            ? Color(0xFFF6F978)
                            : Color(0xFF00595B).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: isLoading
                          ? Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF0A3D3E),
                        ),
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: isEnabled
                                  ? Colors.black
                                  : Color(0xFF0A3D3E).withOpacity(0.5),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: isEnabled
                                ? Colors.black
                                : Color(0xFF0A3D3E).withOpacity(0.5),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}