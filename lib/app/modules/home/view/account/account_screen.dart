import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/home/controller/account_screen_controller.dart';
import 'package:saharan/app/modules/home/widget/account_profile_weg.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.put(AccountController());

    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
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
                ),
                SizedBox(height: 24),

                // Profile section
                Obx(() => account_profile(controller: controller)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

