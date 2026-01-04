import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/authentication/widget/sign_in_weg.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_screen.dart';
import 'package:saharan/app/modules/home/view/home_screen.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class SinInScreen extends StatelessWidget {
  const SinInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          SizedBox(height: 40),

                          // Logo
                          Center(
                            child: Image.asset(
                              AssetPaths.splash_image_one,
                              height: 80,
                              width: 80,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Brand Name
                          Image.asset(
                            AssetPaths.splash_image_two,
                            width: 200,
                            height: 24,
                          ),

                          SizedBox(height: 32),

                          // Welcome Text
                          Text(
                            "Welcome Back!",
                            style: GoogleFonts.orbitron(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            "Sign in to continue getting smart betting insights",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sourceSans3(
                              fontSize: 14,
                              color: Color(0xFFB2B3BD),
                              height: 1.5,
                            ),
                          ),

                          SizedBox(height: 32),

                          // Sign In Form
                          SignIn(),

                          SizedBox(height: 24),

                          // Sign In Button
                          GestureDetector(
                            onTap: () {
                             Get.to(HomeScreen());
                              print("Sign In tapped");
                            },
                            child: Container(
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Color(0xFFF6F978),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF0A3D3E),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Spacer(),

                          // Sign Up Link
                          Center(
                            child: Column(
                              //alignment: WrapAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  onTap: () {
                                    Get.to(SignUpScreen());
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: GoogleFonts.sourceSans3(
                                      fontSize: 16,
                                      color: Color(0xFFF6F978),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 32),
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