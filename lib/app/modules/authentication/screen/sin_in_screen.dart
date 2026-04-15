import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/data/utilitis/custom_snackbar.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/authentication/widget/sign_in_weg.dart';
import 'package:saharan/app/modules/authentication/controller/sin_in_controller.dart';
import 'package:saharan/app/modules/home/view/home_screen.dart';
import 'package:saharan/resource/app_images/app_images.dart';
import 'package:saharan/resource/common_widgets/custom_button.dart';
import 'package:saharan/resource/common_widgets/custom_text.dart';
import '../../../../resource/common_widgets/custom_text_filed.dart';
import 'forgot_password.dart';
import 'sin_up_create_new_account.dart';

class SinInScreen extends StatelessWidget {
  const SinInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 40),

                          // Logo + brand name + welcome texts (unchanged)
                          Center(
                            child: Image.asset(AssetPaths.splash_image_one, height: 80, width: 80),
                          ),
                          const SizedBox(height: 16),
                          Image.asset(AssetPaths.splash_image_two, width: 200, height: 24),
                          SizedBox(height: 20),

                          CustomText(
                            title: "Welcome Back!",
                            style: GoogleFonts.orbitron(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          CustomText(
                            title: "Sign in to continue getting smart betting insights",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sourceSans3(
                              fontSize: 14,
                              color: Color(0xFFB2B3BD),
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 32),

                          // ──── Form starts here ────
                          Form(
                            key: controller.formKey,   // ← attach the key here
                            child: Column(
                              children: [
                                CustomTextField(
                                  label: "Email/Phone Number",
                                  hint: 'Enter your email or phone number',
                                  controller: controller.emailTEController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "Please enter email/phone";
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(height: 10),

                                CustomTextField(
                                  label: "Password",
                                  hint: 'Enter your password',
                                  obscureText: true,
                                  controller: controller.passwordTEController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password is required";
                                    }
                                    if (value.length < 6) {
                                      return "Password must be at least 6 characters";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(() => SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Checkbox(
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
                                    ),
                                  )),
                                  SizedBox(width: 0),
                                  CustomText(
                                    title: "Remember Me",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFB2B3BD),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ForgotPassword());
                                },
                                child: CustomText(
                                  title: "Forgot Password?",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFFF6F978),
                                ),
                              )
                            ],
                          ),

                          const SizedBox(height: 15),

                          Obx(() => controller.isLoading.value
                              ? Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFFF6F978),
                            ),
                          )
                              : CustomButton(
                            title: 'Sign In',
                            onTap: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.signIn();
                              } else {
                                showCustomSnackBar(
                                  message: 'Please fill all fields correctly',
                                );
                              }
                            },
                          ),
                          ),

                          const Spacer(),

                          // Sign Up link (unchanged)
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: GoogleFonts.sourceSans3(
                                    fontSize: 14,
                                    color: Color(0xFFB2B3BD),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Get.to(() => SinUpCreateNewAccount()),
                                  child: Text(
                                    "Sign Up",
                                    style: GoogleFonts.sourceSans3(
                                      fontSize: 16,
                                      color: const Color(0xFFF6F978),
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      decorationColor: const Color(0xFFF6F978),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}