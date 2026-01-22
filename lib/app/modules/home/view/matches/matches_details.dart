import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/resource/app_images/app_images.dart';

import 'matches_headtoheadtab.dart';
import 'matches_overviewtab.dart';
import 'matches_riskanalysistab.dart';

class MatchesDetailsController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}

class MatchesDetails extends StatelessWidget {
  MatchesDetails({super.key});

  final controller = Get.put(MatchesDetailsController());

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(width: 20),
                    Text(
                      "Match Details",
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
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          AssetPaths.arsenal,
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Arsenal',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                    Text(
                      'Not Started',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          AssetPaths.brington,
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Brighton',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTab(
                      text: 'Overview',
                      isSelected: controller.selectedIndex.value == 0,
                      onTap: () {
                        controller.changeTab(0);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTab(
                      text: 'Head to Head',
                      isSelected: controller.selectedIndex.value == 1,
                      onTap: () {
                        controller.changeTab(1);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTab(
                      text: 'Risk Analysis',
                      isSelected: controller.selectedIndex.value == 2,
                      onTap: () {
                        controller.changeTab(2);
                      },
                    ),
                  ),
                ],
              )),
            ),
            SizedBox(height: 24),
            // Content based on selected tab
            Expanded(
              child: Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                    return OverviewTab();
                  case 1:
                    return HeadToHeadTab();
                  case 2:
                    return RiskAnalysisTab();
                  default:
                    return OverviewTab();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTab({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF6F978) : const Color(0xFF0D3B3B),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Color(0xFF215051))
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF053030)
                  : const Color(0xFF7A9999),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}


