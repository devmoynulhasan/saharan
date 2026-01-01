import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/forgot_conform_password_controller.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';

class forgot_confrom_password_weg extends StatelessWidget {
  const forgot_confrom_password_weg({
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
              "Your new password must be different from previously used passwords",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFb1b2bd),
                height: 1.5,
              ),
            ),
            SizedBox(height: 30),

            // New Password Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Password",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Obx(() {
                  return TextFormField(
                    obscureText: !controller.isPasswordVisible.value,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter new password",
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
                      suffixIcon: IconButton(
                        onPressed: controller.togglePasswordVisibility,
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF626e85),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),

            SizedBox(height: 20),

            // Confirm Password Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Obx(() {
                  return TextFormField(
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Re-enter new password",
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
                      suffixIcon: IconButton(
                        onPressed: controller.toggleConfirmPasswordVisibility,
                        icon: Icon(
                          controller.isConfirmPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF626e85),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),

            Spacer(),

            // Continue Button
            Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: Color(0xFFF6F978),
                borderRadius: BorderRadius.circular(26),
              ),
              child: TextButton(
                onPressed: () {
                  Get.to(SinInScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Set New Password",
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