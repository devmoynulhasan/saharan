import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HeadToHeadTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left - Team 1 Wins
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEBE9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '07',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEF4444),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Wins',
                        style: TextStyle(fontSize: 14, color: Colors.redAccent),
                      ),
                    ],
                  ),

                  // Center - Draws
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF0A3D3E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '03',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Draws',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),

                  // Right - Team 2 Wins
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFE1F8EC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '12',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00796B),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Wins',
                        style: TextStyle(fontSize: 14, color: Color(0xFF10B981)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Divider(color: Color(0xFF00595B),thickness: 2,),
            SizedBox(height: 10,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center, // এটা যোগ করুন
                  children: [
                    // Left Percentage
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '33%',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Pie Chart
                    Container(
                      height: 200,
                      width: 200, // width যোগ করুন
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(
                            PieChartData(
                              sectionsSpace: 6,
                              centerSpaceRadius: 60,
                              startDegreeOffset: -90,
                              borderData: FlBorderData(show: false),
                              sections: [
                                PieChartSectionData(
                                  value: 30, // realistic value
                                  color: Color(0xFFFAE80C), // Red
                                  title: '',
                                  radius: 25,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  value: 8,
                                  color: Color(0xFF00595B),
                                  title: '',
                                  radius: 25,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  value: 12, // realistic value
                                  color: Color(0xFF00B2EC), // Green
                                  title: '',
                                  radius: 25,
                                  showTitle: false,
                                ),
                              ],
                            ),
                          ),
                          // মাঝখানে text
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '22',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Total Played',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Right Percentage
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        '65%',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}