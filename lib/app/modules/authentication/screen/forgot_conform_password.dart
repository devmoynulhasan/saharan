import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/authentication/controller/forgot_conform_password_controller.dart';
import 'package:saharan/app/modules/authentication/widget/forget_confrom_password.dart';

class ForgotConformPassword extends StatelessWidget {
  const ForgotConformPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotConformPasswordController controller = Get.put(ForgotConformPasswordController());

    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                      SizedBox(width: 15),
                      Text(
                        "Forgot Password",
                        style: GoogleFonts.orbitron(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              forgot_confrom_password_weg(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}