import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/home/controller/matches/matches_live_controller.dart';
import 'package:saharan/app/modules/home/widget/matches/match_live_laliga.dart';
import 'package:saharan/app/modules/home/widget/matches/matches_live_premier_league.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class MatchesLive extends StatelessWidget {
  const MatchesLive({super.key});

  @override
  Widget build(BuildContext context) {
    // এখানে Get.put() use করুন
    final controller = Get.put(MatchesLiveController());

    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Add your live matches action here
                          },
                          child: Container(
                            height: 36,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEF4444),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: const Color(0xFFEF4444),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Live Now',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
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
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: List.generate(controller.weekDates.length, (index) {
                  DateTime date = controller.weekDates[index];

                  return Padding(
                    padding: EdgeInsets.only(
                      right: index < controller.weekDates.length - 1 ? 12 :0,
                    ),
                    child: Container(
                      height: 70,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFF0A3D3E),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: Color(0xFF00595B))
                            
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.formatDate(date, 'dd'),
                              style: const TextStyle(
                                color: Color(0xFF5A7B7C),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              controller.formatDate(date, 'EEE'),
                              style: const TextStyle(
                                color: Color(0xFF5A7B7C),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 20,),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    MatchLivePremierLeague(),
                    SizedBox(height: 20),
                    MatchesLiveLaLiga(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}


