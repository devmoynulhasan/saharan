import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/home/widget/budget/budget_chart_range_weg.dart';
import 'package:saharan/app/modules/home/widget/budget/budget_premier_league_weg.dart';
import 'package:saharan/app/modules/home/widget/setting_show_modal-bottomsheet_weg.dart';
import 'package:saharan/resource/app_images/app_images.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'see_all_spending_history.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // App Bar Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo and Text
                        Row(
                          children: [
                           Text("Budget",style: GoogleFonts.orbitron(
                             fontWeight: FontWeight.bold,
                             fontSize: 24,
                             color: Color(0xFFEEEEF0),

                           ),)
                          ],
                        ),
                        // Notification Icon
                        GestureDetector(
                          onTap: () {

                            // showModalBottomSheet(
                            //   context: context,
                            //   backgroundColor: Colors.transparent,
                            //   isScrollControlled: true,
                            //   builder: (BuildContext context) {
                            //     return SettingShowModalBottomSheetWeg();
                            //   },
                            // );


                          },
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Budget_Chart_Range_Weg(),

                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Spending this week",style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFFEEEEF0),

                                ),)
                              ],
                            ),
                            // Notification Icon
                            GestureDetector(
                              onTap: () {


                               //   Get.to(SeeAllSpendingHistory());


                              },
                              child: Text("See all",style: GoogleFonts.sourceSans3(
                                fontSize: 18,
                                color: Color(0xFFF6F978),
                                fontWeight: FontWeight.bold
                              ),)
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12,),

                    PremirerLeagueWeg(),

                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}





