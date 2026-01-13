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
              "To get OTP verification code please enter your registered email or phone number",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFb1b2bd),
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),

            // Email/Phone Toggle Buttons
            Obx(() {
              return Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.selectEmail,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: controller.isEmailSelected.value
                              ? Color(0xFFF6F978)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: controller.isEmailSelected.value
                                ? Color(0xFFF6F978)
                                : Color(0xFF0A3D3E),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Email Address",
                            style: GoogleFonts.sourceSans3(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: controller.isEmailSelected.value
                                  ? Color(0xFF0A3D3E)
                                  : Color(0xFFB2B3BD),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.selectPhone,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: !controller.isEmailSelected.value
                              ? Color(0xFFF6F978)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: !controller.isEmailSelected.value
                                ? Color(0xFFF6F978)
                                : Color(0xFF0A3D3E),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Phone Number",
                            style: GoogleFonts.sourceSans3(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: !controller.isEmailSelected.value
                                  ? Color(0xFF0A3D3E)
                                  : Color(0xFFB2B3BD),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),

            SizedBox(height: 24),

            // Email/Phone Input Field
            Obx(() {
              return TextField(
                controller: controller.isEmailSelected.value
                    ? controller.emailController
                    : controller.phoneController,
                keyboardType: controller.isEmailSelected.value
                    ? TextInputType.emailAddress
                    : TextInputType.phone,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: controller.isEmailSelected.value
                      ? "Enter your email address"
                      : "Enter your phone number",
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
              );
            }),

            Spacer(),

            // Continue Button
            GestureDetector(
              onTap: controller.continueToOTP,
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F978),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue",
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}