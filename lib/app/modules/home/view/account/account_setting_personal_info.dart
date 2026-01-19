import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/home/controller/account/account_setting_personal_info_controller.dart';


class PersonalInfoView extends StatelessWidget {
  PersonalInfoView({super.key});

  final controller = Get.put( PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),

            // Profile Image Section
            GestureDetector(
              onTap: controller.pickImage,
              child: Obx(() {
                return Stack(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF005a5c).withOpacity(0.6),
                        border: Border.all(
                          color: Color(0xFF1A5556),
                          width: 2,
                        ),
                        image: controller.selectedImage.value != null
                            ? DecorationImage(
                          image: FileImage(controller.selectedImage.value!),
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      child: controller.selectedImage.value == null
                          ? Center(
                        child: Icon(
                          Icons.person_outline,
                          size: 80,
                          color: Color(0xFF1A5556),
                        ),
                      )
                          : null,
                    ),

                    // Remove button if image is selected
                    if (controller.selectedImage.value != null)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: controller.removeImage,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF6F978),
                            ),
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Color(0xFF0A3D3E),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              }),
            ),

            SizedBox(height: 32),

            // Upload Photo Button
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),

                child: Text(
                  "Upload Profile Photo",
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFF6F978),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "First Name",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: controller.firstNameController, // Controller যোগ করুন
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Write your first name',
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
                ),
                SizedBox(height: 24),
                Text(
                  "Last Name",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: controller.lastNameController, // Controller যোগ করুন
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Write your last name',
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
                ),
              ],
            ),
           SizedBox(height: 90,),
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Center(
                child: Text('Deleted Account',style: TextStyle(
                  color: Colors.pink
                ),),
              ),
            ),
            SizedBox(height: 24,),

            GestureDetector(
              onTap: controller.saveProfile,
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

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}