import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RiskAnalysisTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
             // color: Color(0xFF0D4D4D),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                // Risk Assessment Title
                Row(
                  children: [
                    Text(
                      'Risk assessment',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),

                // Circular Progress Indicator
                CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 20,
                  percent: 0.75,
                  animation: true,
                  animationDuration: 1500,
                  center: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Medium',
                        style: TextStyle(
                          color: Color(0xFFF59E0B),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Risk',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  progressColor: Color(0xFFF59E0B),
                  backgroundColor: Color(0xFF1E3A3A),
                  circularStrokeCap: CircularStrokeCap.round,
                ),

                SizedBox(height: 40),

                // Confidence Level Section
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Confidence Level',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '77%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    // Linear Progress Bar
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 12,
                      percent: 0.77,
                      animation: true,
                      animationDuration: 1500,
                      progressColor: Color(0xFFF6F978),
                      backgroundColor: Color(0xFF0A3333),
                      barRadius: Radius.circular(6),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          // Log This Match Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                print('Log this match');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF6F978),
                foregroundColor: Color(0xFF0A3D3E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Log this match',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}