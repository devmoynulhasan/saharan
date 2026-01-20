
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/home/controller/account/account_change_password_controller.dart';

class AccountSettingChangePasswordScreen extends GetView<AccountChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Password",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Obx(() => TextFormField(
              controller: controller.currentPasswordController,
              obscureText: !controller.isCurrentPasswordVisible.value,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter current password',
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isCurrentPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Color(0xFF68B5B6),
                  ),
                  onPressed: controller.toggleCurrentPasswordVisibility,
                ),
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFF6F978), width: 2),
                ),
              ),
            )),
            SizedBox(height: 24),
            Text(
              "New Password",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Obx(() => TextFormField(
              controller: controller.newPasswordController,
              obscureText: !controller.isNewPasswordVisible.value,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter new password',
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isNewPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Color(0xFF68B5B6),
                  ),
                  onPressed: controller.toggleNewPasswordVisibility,
                ),
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFF6F978), width: 2),
                ),
              ),
            )),
            SizedBox(height: 24),
            Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Obx(() => TextFormField(
              controller: controller.confirmPasswordController,
              obscureText: !controller.isConfirmPasswordVisible.value,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Confirm new password',
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isConfirmPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Color(0xFF68B5B6),
                  ),
                  onPressed: controller.toggleConfirmPasswordVisibility,
                ),
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFF6F978), width: 2),
                ),
              ),
            )),
            SizedBox(height: 32),
            GestureDetector(
              onTap: controller.saveChanges,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F978),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Save Changes",
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0A3D3E),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// // Binding (optional but recommended)
// class ChangePasswordBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
//   }
// }