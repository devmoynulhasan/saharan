import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/sin_in_controller.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email/Phone Number",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter your email or phone number',
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
        SizedBox(height: 20),

        Text(
          "Password",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Obx(() => TextFormField(
          obscureText: !controller.isPasswordVisible.value,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter your password',
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
            suffixIcon: IconButton(
              icon: Icon(
                controller.isPasswordVisible.value
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Color(0xFF626e85),
              ),
              onPressed: () {
                controller.togglePasswordVisibility();
              },
            ),
          ),
        )),


        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Obx(() => Checkbox(
                  value: controller.rememberMe.value,
                  onChanged: (value) {
                    controller.toggleRememberMe();
                  },
                  activeColor: Color(0xFFF6F978),
                  checkColor: Color(0xFF0A3D3E),
                  side: BorderSide(
                    color: Color(0xFFB2B3BD),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                )),
                SizedBox(width: 0),
                Text(
                  "Remember Me",
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFB2B3BD),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                // Forgot password navigation
                // Get.toNamed(AppRoutes.FORGOT_PASSWORD);
              },
              child: Text(
                "Forgot Password?",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFFF6F978),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}