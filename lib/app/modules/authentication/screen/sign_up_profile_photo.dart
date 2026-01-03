import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saharan/app/modules/authentication/controller/sign_up_profile_photo_controller.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';



class SignUpProfilePhoto extends StatelessWidget {
  const SignUpProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpProfilePhotoController controller = Get.put(SignUpProfilePhotoController());

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),

                // Back Button
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF0A3D3E),
                      border: Border.all(
                        color: Color(0xFF1A5556),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 32),

                // Title
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

                // Subtitle
                Text(
                  "Upload a photo to personalize your profile",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 14,
                    color: Color(0xFFB2B3BD),
                    height: 1.5,
                  ),
                ),

                SizedBox(height: 60),

                // Profile Photo Circle with Image
                Center(
                  child: Obx(() {
                    return Stack(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF005a5c).withOpacity(0.6),
                            border: Border.all(
                              color: Color(0xFF1A5556),
                              width: 2,
                            ),
                            image: controller.selectedImage.value != null
                                ? DecorationImage(
                              image: FileImage(controller.selectedImage.value!),
                              fit: BoxFit.cover,
                            )
                                : null,
                          ),
                          child: controller.selectedImage.value == null
                              ? Center(
                            child: Icon(
                              Icons.person_outline,
                              size: 80,
                              color: Color(0xFF1A5556),
                            ),
                          )
                              : null,
                        ),

                        // Remove button if image is selected
                        if (controller.selectedImage.value != null)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: controller.removeImage,
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFF6F978),
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Color(0xFF0A3D3E),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
                ),

                SizedBox(height: 32),

                // Upload Photo Button
                Center(
                  child: GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFFF6F978),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Upload Photo",
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFF6F978),
                        ),
                      ),
                    ),
                  ),
                ),

                Spacer(),

                // Skip for now button
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Skip action - navigate to next screen
                      print("Skip for now tapped");
                       Get.to(SinInScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "Skip for now",
                        style: GoogleFonts.sourceSans3(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF6F978),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // Get Started Button (Enabled/Disabled based on image)
                Obx(() {
                  bool isEnabled = controller.selectedImage.value != null;

                  return GestureDetector(
                    onTap: isEnabled
                        ? () {
                      // Get started action
                      print("Get Started tapped");
                       Get.to( SinInScreen());
                    }
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
                      child: Row(
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