import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/forgot_password_controller.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/authentication/widget/forgot_weg.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX controller instance
    final ForgotPasswordController controller = Get.put(ForgotPasswordController());

    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: [
              // Custom AppBar
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

              // Body Content
              Forgot_Weg(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

