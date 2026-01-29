import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/home/controller/matches/matches_controller.dart';
import 'package:saharan/app/modules/home/view/matches/matches_details.dart';
import 'package:saharan/app/modules/home/view/matches/matches_live.dart';
import 'package:saharan/app/modules/home/widget/matches/matches_full_half_time_weg.dart';
import 'package:saharan/resource/app_images/app_images.dart';


class MatchesScreen extends GetView<MatchesController> {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(MatchesController());

    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                _buildHeader(),
                const SizedBox(height: 34),
                _buildDateSelector(),
                const SizedBox(height: 20),
                _buildPremierLeagueSection(),
                const SizedBox(height: 20),
                _buildLaLigaSection(),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: (){

                  },
                    child: _buildBundesligaSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Matches',
          style: GoogleFonts.orbitron(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: const Color(0xFFEEEEF0),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                Get.to( MatchesLive() );
                },
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    border: Border.all(
                      color: const Color(0xFFEF4444),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEF4444),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Live Now',
                        style: TextStyle(
                          color: Color(0xFFEF4444),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15,),
              GestureDetector(
                onTap: () {
                  // Add your filter/settings action here
                },
                child: Image.asset(
                  AssetPaths.match_icon,
                  height: 26,
                  width: 26,
                ),
              ),
            ],
        )
      ],
    );
  }

  Widget _buildDateSelector() {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(controller.weekDates.length, (index) {
            DateTime date = controller.weekDates[index];
            bool isToday = controller.isToday(date);
            bool isSelected = controller.selectedIndex.value == index;

            return Padding(
              padding: EdgeInsets.only(
                right: index < controller.weekDates.length - 1 ? 12 : 0,
              ),
              child: GestureDetector(
                onTap: () => controller.selectDate(index, date),
                child: Container(
                  height: 80,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isSelected
                        ? const Color(0xFFF6F978).withOpacity(0.2)
                        : const Color(0xFF0A3D3E),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFF6F978)
                          : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.formatDate(date, 'dd'),
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFFF6F978)
                              : const Color(0xFFFFFFFF),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.formatDate(date, 'EEE'),
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFFF6F978).withOpacity(0.7)
                              : const Color(0xFF68B5B6),
                          fontSize: 12,
                        ),
                      ),
                      if (isToday)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            'Today',
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFFF6F978)
                                  : const Color(0xFF68B5B6),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }

  Widget _buildPremierLeagueSection() {
    return Obx(() {
      bool isExpanded = controller.isPremierLeagueExpanded.value;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isExpanded ? 570 : 90,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xFF0A3D3E),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildLeagueHeader(
                logoPath: AssetPaths.premier_league,
                title: 'Premier League',
                country: 'England',
                matchCount: controller.getMatchCount('Premier League'),
                isExpanded: isExpanded,
                onToggle: controller.togglePremierLeague,
              ),
              if (isExpanded) ...[
                const Divider(color: Color(0xFF00595B)),
                const MatchesFullTiimeHalfTime(),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLaLigaSection() {
    return Obx(() {
      bool isExpanded = controller.isLaLigaExpanded.value;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isExpanded ? 570 : 90,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xFF0A3D3E),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildLeagueHeader(
                logoPath: AssetPaths.laliga,
                title: 'LaLiga',
                country: 'Spain',
                matchCount: controller.getMatchCount('LaLiga'),
                isExpanded: isExpanded,
                onToggle: controller.toggleLaLiga,
              ),
              if (isExpanded) ...[
                const Divider(color: Color(0xFF00595B)),
                const MatchesFullTiimeHalfTime(),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget  _buildBundesligaSection() {
    return Obx(() {
      bool isExpanded = controller.isBundesligaExpanded.value;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isExpanded ? 570 : 90,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xFF0A3D3E),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildLeagueHeader(
                logoPath: AssetPaths.bundesliga,
                title: 'Bundesliga',
                country: 'Germany',
                matchCount: controller.getMatchCount('Bundesliga'),
                isExpanded: isExpanded,
                onToggle: controller.toggleBundesliga,
              ),
              if (isExpanded) ...[
                const Divider(color: Color(0xFF00595B)),

                const MatchesFullTiimeHalfTime(),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLeagueHeader({
    required String logoPath,
    required String title,
    required String country,
    required int matchCount,
    required bool isExpanded,
    required VoidCallback onToggle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  logoPath,
                  height: 24,
                  width: 24,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    country,
                    style: const TextStyle(
                      color: Color(0xFFB2B3BD),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF184647),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    Text(
                      matchCount.toString(),
                      style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF68B5B6),
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onToggle,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF184647),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: const Color(0xFF68B5B6),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}