import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/sign_up_controller.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_varify_otp.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUPController controller = Get.put(SignUPController());

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
                Row(
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
                  ],
                ),

                SizedBox(height: 32),

                // Title
                Text(
                  "Create New Account",
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
                  "Enter your email address to get started",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 14,
                    color: Color(0xFFB2B3BD),
                    height: 1.5,
                  ),
                ),

                SizedBox(height: 32),
                Text(
                  " Email Address ",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 16,
                    color: Color(0xFFFFFFFF),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8,),
                // Email Input Field
                TextField(
                  controller: controller.emailController,
                  style: GoogleFonts.sourceSans3(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your email address",
                    hintStyle: GoogleFonts.sourceSans3(
                      color: Color(0xFF507B7C),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Color(0xFF0A3D3E).withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFF1A5556),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFF1A5556),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFFF6F978),
                        width: 1.5,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),

                Spacer(),

                // Continue Button
                Obx(() => GestureDetector(
                  onTap: controller.isLoading.value ? null : controller.onContinue,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: controller.isLoading.value
                          ? Color(0xFFF6F978).withOpacity(0.5)
                          : Color(0xFFF6F978),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: controller.isLoading.value
                        ? Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF0A3D3E),
                          ),
                        ),
                      ),
                    )
                        :
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0A3D3E),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF0A3D3E),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                )),

                SizedBox(height: 20),

                // Sign In Text


                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}