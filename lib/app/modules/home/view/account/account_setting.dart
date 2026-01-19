import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/home/controller/account/account_setting_controller.dart';

import 'account_setting_change_password.dart';
import 'account_setting_personal_info.dart';

// Controller for managing tab state


class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final controller = Get.put(AccountSettingController());

    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                      "Account Setting",
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
            SizedBox(height: 40),

            // Toggle Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF0A3D3E),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color(0xFF00595b),
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: Obx(() => Row(
                  children: [
                    Expanded(
                      child: _buildTabButton(
                        title: "Personal Info",
                        isSelected: controller.selectedIndex.value == 0,
                        onTap: () => controller.changeTab(0),
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: _buildTabButton(
                        title: "Change Password",
                        isSelected: controller.selectedIndex.value == 1,
                        onTap: () => controller.changeTab(1),
                      ),
                    ),
                  ],
                )),
              ),
            ),

            SizedBox(height: 20),

            // Content based on selected tab
            Expanded(
              child: Obx(() => controller.selectedIndex.value == 0
                  ? PersonalInfoView()
                  : AccountSettingChangePasswordScreen()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF6F978) : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.sourceSans3(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Color(0xFF053030)
                  : Color(0xFF68B5B6),
            ),
          ),
        ),
      ),
    );
  }
}



