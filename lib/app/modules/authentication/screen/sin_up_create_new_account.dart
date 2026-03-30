import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/controller/authentication_controller.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_screen.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/resource/app_images/app_images.dart';

import 'google_sigin/firebase_google_sign_in.dart';

class SinUpCreateNewAccount extends StatelessWidget {
  const SinUpCreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationController controller = Get.put(AuthenticationController());
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(        // ← Wrap করো
            padding: const EdgeInsets.all(12.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(          // ← এটা Spacer কে কাজ করাবে
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Center(
                      child: Image.asset(
                        AssetPaths.splash_image_one, height: 70, width: 40,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(child: Image.asset(AssetPaths.splash_image_two, height: 25, width: 200)),
                    SizedBox(height: 40),
                    Center(
                      child: Text("Create New Account", style: GoogleFonts.orbitron(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF),
                      )),
                    ),
                    SizedBox(height: 40),

                    FairvaseGoogleSigin(),

                    SizedBox(height: 20),
                    Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF0A3D3E),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AssetPaths.apple, height: 24, width: 24),
                          SizedBox(width: 15),
                          Text("Continue with Apple", style: TextStyle(color: Color(0xFFFFFFFF))),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Divider(color: Color(0xFF68B5B6), thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('OR', style: TextStyle(fontSize: 14, color: Color(0xFF68B5B6))),
                        ),
                        Expanded(child: Divider(color: Color(0xFF68B5B6), thickness: 1)),
                      ],
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => Get.to(SignUpScreen()),
                      child: Container(
                        height: 52,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF0A3D3E),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AssetPaths.sinup_email, height: 24, width: 24),
                            SizedBox(width: 15),
                            Text("Continue with Email", style: TextStyle(color: Color(0xFFFFFFFF))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(fontSize: 13, color: Color(0xFFEEEEF0)),
                          children: [
                            TextSpan(text: 'By signing up, you agree to our '),
                            TextSpan(text: 'Terms & Conditions', style: TextStyle(color: Color(0xFFD4FF4D), fontWeight: FontWeight.bold)),
                            TextSpan(text: ' and review our '),
                            TextSpan(text: 'Privacy Policy', style: TextStyle(color: Color(0xFFD4FF4D), fontWeight: FontWeight.bold)),
                            TextSpan(text: ' to learn how we protect your data.'),
                          ],
                        ),
                      ),
                    ),

                    Spacer(),   // ← এখন কাজ করবে IntrinsicHeight এর কারণে

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",
                            style: GoogleFonts.sourceSans3(fontSize: 14, color: Color(0xFFB2B3BD), fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => SinInScreen()),
                            child: Text("Sign In",
                              style: GoogleFonts.sourceSans3(
                                fontSize: 16,
                                color: Color(0xFFF6F978),
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFF6F978),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
