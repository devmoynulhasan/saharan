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
      decoration: BoxDecoration(
        color: Color(0xFF0A3D3E),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Profile Picture - Obx দিয়ে wrap করা
            GestureDetector(
              onTap: controller.pickImage,
              child: Obx(() => Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: controller.pickedImage.value != null
                      ? Image.file(
                    controller.pickedImage.value!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Error হলে placeholder icon দেখাবে
                      return Container(
                        color: Colors.grey[700],
                        child: Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.white70,
                        ),
                      );
                    },
                  )
                      : Container(
                    color: Colors.grey[700],
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Colors.white70,
                    ),
                  ),
                ),
              )),
            ),
            SizedBox(width: 16),
            // Name and Email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(
                  controller.userName.value,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
                Obx(() => Text(
                  controller.userEmail.value,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}