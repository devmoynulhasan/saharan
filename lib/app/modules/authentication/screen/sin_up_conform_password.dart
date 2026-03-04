import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/sign_up_conform_password_controller.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

class SinUpConformPassword extends StatelessWidget {
  final String email; // ✅ email parameter
  const SinUpConformPassword({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final SignUpConformPasswordController controller =
    Get.put(SignUpConformPasswordController(email: email)); // ✅ email pass

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Back Button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFF6F978).withOpacity(0.1),
                                  spreadRadius: 7,
                                ),
                              ],
                              shape: BoxShape.circle,
                              color: const Color(0xFF053030),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Color(0xFFF6F978),
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Title
                  Text(
                    "Secure Your Account",
                    style: GoogleFonts.orbitron(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  Text(
                    "Create a strong password to protect your account",
                    style: GoogleFonts.sourceSans3(
                      fontSize: 14,
                      color: const Color(0xFFB2B3BD),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Password Label
                  Text(
                    "Password",
                    style: GoogleFonts.sourceSans3(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Password Field
                  Obx(() {
                    return TextFormField(
                      controller: controller.passwordController,
                      obscureText: !controller.isPasswordVisible.value,
                      style: GoogleFonts.sourceSans3(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter new password",
                        hintStyle: GoogleFonts.sourceSans3(
                          color: const Color(0xFF507B7C),
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF0A3D3E).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF1A5556),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF1A5556),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFF6F978),
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        suffixIcon: IconButton(
                          onPressed: controller.togglePasswordVisibility,
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF626e85),
                          ),
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 24),

                  // Confirm Password Label
                  Text(
                    "Confirm Password",
                    style: GoogleFonts.sourceSans3(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Confirm Password Field
                  Obx(() {
                    return TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: !controller.isConfirmPasswordVisible.value,
                      style: GoogleFonts.sourceSans3(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: "Re-enter new password",
                        hintStyle: GoogleFonts.sourceSans3(
                          color: const Color(0xFF507B7C),
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF0A3D3E).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF1A5556),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF1A5556),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFF6F978),
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        suffixIcon: IconButton(
                          onPressed: controller.toggleConfirmPasswordVisibility,
                          icon: Icon(
                            controller.isConfirmPasswordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF626e85),
                          ),
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 100),

                  // Complete Sign Up Button
                  Obx(() => GestureDetector(
                    onTap: controller.isLoading.value
                        ? null
                        : () => controller.singUpConformPassword(), // ✅ সরাসরি call, navigation controller এ হবে
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F978),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                          color: Color(0xFF0A3D3E),
                          strokeWidth: 2,
                        )
                            : Text(
                          "Complete Sign Up",
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0A3D3E),
                          ),
                        ),
                      ),
                    ),
                  )),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}