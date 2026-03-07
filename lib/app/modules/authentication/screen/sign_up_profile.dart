import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/sin_up_profile_controller.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_profile_photo.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

class SignUpProfile extends StatelessWidget {
  const SignUpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpProfileController controller = Get.put(SignUpProfileController());

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36),

                SizedBox(height: 32),

                // Title
                Text(
                  "Set Up Your Profile",
                  style: GoogleFonts.orbitron(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 12),

                // Subtitle
                Text(
                  "Tell us your name so we can personalize your experience",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 14,
                    color: Color(0xFFB2B3BD),
                    height: 1.5,
                  ),
                ),

                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: controller.firstNameController, // Controller যোগ করুন
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Write your first name',
                        hintStyle: TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFFF6F978), width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Last Name",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: controller.lastNameController, // Controller যোগ করুন
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Write your last name',
                        hintStyle: TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFFF6F978), width: 2),
                        ),
                      ),
                    ),
                  ],
                ),

                Spacer(),

                // Bottom Button
                Obx(() => GestureDetector(
                  onTap: controller.isLoading.value
                      ? null
                      : () => controller.singUpProfile(),
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F978),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Center(
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                        color: Color(0xFF0A3D3E),
                        strokeWidth: 2,
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0A3D3E),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward,
                            color: Color(0xFF0A3D3E),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),

                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}