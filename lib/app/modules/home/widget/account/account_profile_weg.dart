import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/home/controller/account/account_screen_controller.dart';

class account_profile extends StatelessWidget {
  const account_profile({
    super.key,
    required this.controller,
  });

  final AccountController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF0A3D3E),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          // Loading skeleton
          if (controller.isLoading.value) {
            return Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 14,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 12,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }

          return Row(
            children: [
              // ─── Profile Picture ───
              GestureDetector(
                onTap: controller.pickImage,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: _buildProfileImage(controller),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // ─── Name & Email ───
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.userName.value.isEmpty
                          ? 'User Name'
                          : controller.userName.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      controller.userEmail.value.isEmpty
                          ? 'user@email.com'
                          : controller.userEmail.value,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildProfileImage(AccountController controller) {
    // Priority 1: Gallery থেকে pick করা image
    if (controller.pickedImage.value != null) {
      return Image.file(
        controller.pickedImage.value!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }

    // Priority 2: API থেকে আসা network image
    if (controller.profileImageUrl.value.isNotEmpty) {
      return Image.network(
        controller.profileImageUrl.value,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[700],
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF6F978)),
              ),
            ),
          );
        },
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }

    // Priority 3: Default placeholder
    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      color: Colors.grey[700],
      child: const Icon(Icons.person, size: 35, color: Colors.white70),
    );
  }
}