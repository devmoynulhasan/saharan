import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/home/widget/budget/budget_premier_league_weg.dart';
import 'package:saharan/app/modules/home/widget/desbord/deshbord_spending_week_weg.dart';
import 'package:saharan/resource/app_images/app_images.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                          Image.asset(
                            AssetPaths.splash_image_one,
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            AssetPaths.splash_image_two,
                            height: 40,
                            width: 140,
                          ),
                        ],
                      ),
                      // Notification Icon
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(AssetPaths.favourite,height: 24,width: 24,color: Colors.white,),
                            SizedBox(width: 15,),
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 24,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF0A3D3E),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weekly Budget",
                            style: GoogleFonts.sourceSans3(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          // Radial Gauge
                          Container(
                            height: 200,
                            child: SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  minimum: 0,
                                  maximum: 100,
                                  startAngle: 180,
                                  endAngle: 0,
                                  showLabels: false,
                                  showTicks: false,
                                  axisLineStyle: AxisLineStyle(
                                    thickness: 40,
                                    color: Color(0xFF00595b),
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      value: 75,
                                      width: 40,
                                      color: Color(0xFFf6f978),
                                    ),
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    // Center এ 400 UGX এবং Left more
                                    GaugeAnnotation(
                                      widget: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '400 UGX',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Left more',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                      angle: 90,
                                      positionFactor: 0.1,
                                    ),
                                    // বাম দিকে 75% - yellow arc এর মাঝখানে
                                    GaugeAnnotation(
                                      widget: Text(
                                        '75%',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      angle: 135,
                                      positionFactor: 0.75,
                                    ),
                                    // ডান দিকে 25% - teal arc এর মাঝখানে
                                    GaugeAnnotation(
                                      widget: Text(
                                        '25%',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      angle: 30,
                                      positionFactor: 0.75,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          // Used and Limit
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "1600 UGX",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Used",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "2000 UGX",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Limit",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(
                            color: Color(0xFF00595B),
                            thickness: 1,
                          ),
                          SizedBox(height: 16),
                          // Safe and Adjust Limit
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 44,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xFF184647),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    'Safe',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'Adjust Limit',
                                      style: TextStyle(
                                        color: Color(0xFFF6F978),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(0xFFF6F978),
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Favorite team’s matches',style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Deshbord_Spending_Week_Weg(),

                  SizedBox(height: 20,),
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
                               // Get.to(SeeAllSpendingHistory());
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
                  SizedBox(height: 10,),

                  PremirerLeagueWeg(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

