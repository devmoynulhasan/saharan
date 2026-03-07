import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/forgot_password_controller.dart';

class Forgot_Weg extends StatelessWidget {
  const Forgot_Weg({
    super.key,
    required this.controller,
  });

  final ForgotPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Identity Verification",
              style: GoogleFonts.orbitron(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "To get OTP verification code please enter your registered email address",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFb1b2bd),
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),

            // Email Input Field
            Text(
              "Email address",
              style: GoogleFonts.sourceSans3(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8,),

            TextField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter your email address",
                hintStyle: TextStyle(
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
                  vertical: 14,
                ),
              ),
            ),

            Spacer(),

            // Continue Button
            // Forgot_Weg এ button ঠিক করো
            Obx(() => GestureDetector(
              onTap: controller.isLoading.value
                  ? null
                  : () => controller.continueToOTP(), // ✅
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
                        "Continue",
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
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}