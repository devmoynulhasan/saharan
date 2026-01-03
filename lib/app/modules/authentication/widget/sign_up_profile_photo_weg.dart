import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/sign_up_profile_photo_controller.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';

class Sign_Up_profile_Photo_Widget extends StatelessWidget {
  const Sign_Up_profile_Photo_Widget({
    super.key,
    required this.controller,
  });

  final SignUpProfilePhotoController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}