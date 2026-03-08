import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/forgot_conform_password_controller.dart';

class ForgotConformPasswordWidget extends StatelessWidget {
  const ForgotConformPasswordWidget({
    super.key,
    required this.controller,
  });

  final ForgotConformPasswordController controller;

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
              "Create New Password",
              style: GoogleFonts.orbitron(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Create a strong password with at least 6 characters to secure your account",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFb1b2bd),
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),

            // Password Field
            Obx(() {
              return TextField(
                controller: controller.passwordController,
                obscureText: !controller.isPasswordVisible.value,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter new password",
                  hintStyle: TextStyle(
                    color: Color(0xFF507B7C),
                    fontSize: 14,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFF68B5B6),
                    ),
                    onPressed: controller.togglePasswordVisibility,
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

            SizedBox(height: 16),

            // Confirm Password Field
            Obx(() {
              return TextField(
                controller: controller.confirmPasswordController,
                obscureText: !controller.isConfirmPasswordVisible.value,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Confirm new password",
                  hintStyle: TextStyle(
                    color: Color(0xFF507B7C),
                    fontSize: 14,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFF68B5B6),
                    ),
                    onPressed: controller.toggleConfirmPasswordVisibility,
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

            // Reset Password Button
            Obx(() => GestureDetector(
              onTap: controller.isLoading.value ? null : controller.resetPassword,
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F978),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Center(
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(
                    color: Color(0xFF0A3D3E),
                    strokeWidth: 2,
                  )
                      : Text(
                    "Set New Password",
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A3D3E),
                    ),
                  ),
                ),
              ),
            )),
            SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}