import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/home/controller/account/account_setting_personal_info_controller.dart';

class PersonalInfoView extends StatelessWidget {
  PersonalInfoView({super.key});

  final controller = Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ─── Full page loading ───
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF6F978)),
          ),
        );
      }

      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // ─── Profile Image ───
              GestureDetector(
                onTap: controller.pickImage,
                child: Obx(() => Stack(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF005a5c).withOpacity(0.6),
                        border: Border.all(
                            color: const Color(0xFF1A5556), width: 2),
                      ),
                      child: ClipOval(child: _buildProfileImage()),
                    ),

                    // ─── Camera icon ───
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF6F978),
                        ),
                        child: const Icon(Icons.camera_alt,
                            size: 18, color: Color(0xFF0A3D3E)),
                      ),
                    ),

                    // ─── Remove button (local image only) ───
                    if (controller.selectedImage.value != null)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: controller.removeImage,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF6F978),
                            ),
                            child: const Icon(Icons.close,
                                size: 20, color: Color(0xFF0A3D3E)),
                          ),
                        ),
                      ),
                  ],
                )),
              ),

              const SizedBox(height: 12),

              GestureDetector(
                onTap: controller.pickImage,
                child: Text(
                  "Upload Profile Photo",
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFF6F978),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ─── First Name ───
              _buildInputField(
                label: 'First Name',
                hint: 'Write your first name',
                textController: controller.firstNameController,
              ),

              const SizedBox(height: 24),

              // ─── Last Name ───
              _buildInputField(
                label: 'Last Name',
                hint: 'Write your last name',
                textController: controller.lastNameController,
              ),

              const SizedBox(height: 90),

              // ─── Delete Account ───
              GestureDetector(
                onTap: () => Get.back(),
                child: const Center(
                  child: Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ─── Save Button ───
              Obx(() => GestureDetector(
                onTap: controller.isSaving.value
                    ? null
                    : controller.saveProfile,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: controller.isSaving.value
                        ? const Color(0xFFF6F978).withOpacity(0.5)
                        : const Color(0xFFF6F978),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: controller.isSaving.value
                        ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF0A3D3E)),
                      ),
                    )
                        : Text(
                      "Save Changes",
                      style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0A3D3E),
                      ),
                    ),
                  ),
                ),
              )),

              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    });
  }

  // ─── Profile image: picked → network → placeholder ───
  Widget _buildProfileImage() {
    if (controller.selectedImage.value != null) {
      return Image.file(
        controller.selectedImage.value!,
        fit: BoxFit.cover,
        width: 180,
        height: 180,
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }
    if (controller.networkImageUrl.value.isNotEmpty) {
      return Image.network(
        controller.networkImageUrl.value,
        fit: BoxFit.cover,
        width: 180,
        height: 180,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            color: const Color(0xFF005a5c).withOpacity(0.6),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                AlwaysStoppedAnimation<Color>(Color(0xFFF6F978)),
              ),
            ),
          );
        },
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }
    return _placeholder();
  }

  Widget _placeholder() => Center(
    child: Icon(
      Icons.person_outline,
      size: 80,
      color: const Color(0xFF1A5556),
    ),
  );

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController textController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, color: Colors.white)),
        const SizedBox(height: 8),
        TextFormField(
          controller: textController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
              BorderSide(color: Colors.white.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
              BorderSide(color: Colors.white.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
              const BorderSide(color: Color(0xFFF6F978), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}