import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/data/utilitis/custom_snackbar.dart' hide SnackPosition;
import 'package:saharan/app/modules/authentication/screen/sign_up_varify_otp.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/resource/common_widgets/custom_button.dart';
import 'package:saharan/resource/common_widgets/custom_text.dart';
import 'package:saharan/resource/common_widgets/custom_text_filed.dart';

import '../controller/authentication_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

   final AuthenticationController controller = Get.put(AuthenticationController());

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
                CustomText(
                  title: "Create New Account",
                  style: GoogleFonts.orbitron(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: 12),

                // Subtitle
                CustomText(
                  title: "Enter your email address to get started",
                  fontSize: 14,
                  color: Color(0xFFB2B3BD),
                  height: 1.5,
                ),

                SizedBox(height: 32),
                CustomText(
                  title: "Email Address ",
                  fontSize: 16,
                  color: Color(0xFFFFFFFF),
                  height: 1.5,
                ),
                SizedBox(height: 8,),

                // Email Input Field
                CustomTextField(
                  controller: controller.emailController,
                    hint: "Enter your email address"
                ),

                Spacer(),

                Obx(()=> CustomButton(
                      title: 'Continue',
                      isLoading: controller.isLoading.value,
                      onTap: () {
                        if(controller.emailController.text.isEmpty){
                          showCustomSnackBar(message: 'Email is required', type: SnackType.error,
                          );
                        }else{
                          controller.createUser();
                          // Get.to(() => SignUpVarifyOtp(email: controller.emailController.text));
                        }
                      },
                  ),
                ),

                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}