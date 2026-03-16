import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

import '../../controller/account/premium_plan_controller.dart';

// ─── Controller ───


// ─── View ───
class PremiumPlan extends StatelessWidget {
  PremiumPlan({super.key});

  final PlanController controller = Get.put(PlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ─── AppBar ───
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFF6F978).withOpacity(0.1),
                                spreadRadius: 7,
                              )
                            ],
                            shape: BoxShape.circle,
                            color: const Color(0xFF053030),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFFF6F978),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "Premium Plan",
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

              // ─── Title ───
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Text(
                      "UNLOCK THE FULL POWER of the",
                      style: GoogleFonts.orbitron(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F978),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "SAHARAN PREMIUM",
                        style: GoogleFonts.orbitron(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ─── Premium Features ───
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A3D3E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Premium Features",
                        style: GoogleFonts.sourceSans3(
                          color: const Color(0xFFF6F978),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildFeatureItem("No Ads"),
                      _buildFeatureItem("Full Access to AI Predictions"),
                      _buildFeatureItem("Full Access to Budgeting Feature"),
                    ],
                  ),
                ),
              ),
SizedBox(height: 20,),
              // ─── Plan Selector ───
              Obx(
                    () => Column(
                  children: controller.plans.map((plan) {
                    final bool isSelected =
                        controller.selectedPlan.value == plan['title'];
                    return GestureDetector(
                      onTap: () => controller.selectPlan(plan['title']),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A3D3E),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFF6F978)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ─── Left: Radio + Title ───
                            Row(
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_unchecked,
                                  color: isSelected
                                      ? const Color(0xFFF6F978)
                                      : Colors.white54,
                                  size: 22,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  plan['title'],
                                  style: GoogleFonts.sourceSans3(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            // ─── Right: Price ───
                            Text(
                              plan['price'],
                              style: GoogleFonts.sourceSans3(
                                fontSize: 16,
                                color: isSelected
                                    ? const Color(0xFFF6F978)
                                    : Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 50,),
              SizedBox(height: 50),

// ─── Free User Text ───
              Text(
                "You're a SAHARAN Free User",
                style: GoogleFonts.sourceSans3(
                  color: Color(0xFFF6F978),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 16),

// ─── Subscribe Button ───
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F978),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Center(
                    child: Text(
                      "Subscribe Now",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Feature Item Helper ───
  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check, color: Color(0xFFF6F978), size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.sourceSans3(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}