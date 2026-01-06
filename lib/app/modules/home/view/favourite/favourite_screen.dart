import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/home/controller/favourite_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavouriteController controller = Get.put(FavouriteController());

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    Text(
                      "Favorites",
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Toggle Buttons
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF0A3D3E),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Color(0xFF00595b),
                    )
                  ),
                  padding: EdgeInsets.all(8),
                  child: Obx(() => Row(
                    children: [
                      Expanded(
                        child: _buildTabButton(
                          title: "Team",
                          isSelected: controller.selectedIndex.value == 0,
                          onTap: () => controller.changeTab(0),
                        ),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: _buildTabButton(
                          title: "League",
                          isSelected: controller.selectedIndex.value == 1,
                          onTap: () => controller.changeTab(1),
                        ),
                      ),
                    ],
                  )),
                ),

                SizedBox(height: 20),

                // Content based on selected tab
                Expanded(
                  child: Obx(() => controller.selectedIndex.value == 0
                      ? _buildTeamContent()
                      : _buildLeagueContent()),
                ),
              ],
            ),
          ),
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
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF6F978) : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.sourceSans3(
              color: isSelected ? Color(0xFF0A3D3E) : Colors.white,
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamContent() {
    return Center(
      child: Text(
        "Team Favorites",
        style: GoogleFonts.sourceSans3(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildLeagueContent() {
    return Center(
      child: Text(
        "League Favorites",
        style: GoogleFonts.sourceSans3(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}