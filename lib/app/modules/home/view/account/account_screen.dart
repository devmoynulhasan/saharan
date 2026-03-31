import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/home/controller/account/account_screen_controller.dart';
import 'package:saharan/app/modules/home/view/account/privacy_policy.dart';
import 'package:saharan/app/modules/home/view/account/terms_conditions.dart';
import 'package:saharan/app/modules/home/widget/account/account_more_support.dart';
import 'package:saharan/app/modules/home/widget/account/account_profile_weg.dart';
import 'package:saharan/app/modules/home/widget/account/accout_more_tools.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.find<AccountController>();

    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Header
                    Row(
                      children: [
                        Text(
                          "Account",
                          style: GoogleFonts.orbitron(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFFEEEEF0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Profile section - Remove Obx from here
                    account_profile(controller: controller),

                    SizedBox(height:15 ,),
                    Row(
                      children: [
                        Text('More Tools',style: GoogleFonts.sourceSans3(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF)
                        ),)
                      ],
                    ),
                    SizedBox(height: 8,),

                    Account_Mote_Tools(),

                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Text('More Info & Support',style: GoogleFonts.sourceSans3(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF)
                        ),)
                      ],
                    ),
                    SizedBox(height: 8,),

                    Account_More_Support(),

                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Text('Others',style: GoogleFonts.sourceSans3(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF)
                        ),)
                      ],
                    ),
                    SizedBox(height: 8,),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0A3D3E),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                        children: [
                          // ─── Privacy Policy ───
                          InkWell(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            onTap: () => Get.to(PrivacyPolicy()),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AssetPaths.privacy, height: 24, width: 24),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Privacy Policy',
                                        style: GoogleFonts.sourceSans3(
                                          fontSize: 16,
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(AssetPaths.back_icon, height: 24, width: 7),
                                ],
                              ),
                            ),
                          ),

                          const Divider(color: Color(0xFF215051), height: 1),

                          // ─── Terms & Conditions ───
                          InkWell(
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                            onTap: () => Get.to(TermsConditions()),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AssetPaths.terms, height: 24, width: 24),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Terms & Conditions',
                                        style: GoogleFonts.sourceSans3(
                                          fontSize: 16,
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(AssetPaths.back_icon, height: 24, width: 7),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                SizedBox(height:45 ,),

                    InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      onTap: () => Get.to(SinInScreen()),
                      child: Container(
                        padding: const EdgeInsets.all(22),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0A3D3E),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(AssetPaths.logout, height: 24, width: 24),
                            const SizedBox(width: 10),
                            Text(
                              'Sign Out',
                              style: GoogleFonts.sourceSans3(
                                fontSize: 16,
                                color: const Color(0xFFEF4444),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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




