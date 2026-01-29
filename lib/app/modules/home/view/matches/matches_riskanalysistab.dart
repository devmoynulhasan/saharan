import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
             color: Color(0xFF0D4D4D),
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

          SizedBox(height: 194),

          // Log This Match Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF0A3D3E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Back button and title
                          Row(
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
                                "Log Match",
                                style: GoogleFonts.orbitron(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),

                          // Amount field
                          Text(
                            'Amount (UGX)',
                            style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter bet amount',
                              hintStyle: TextStyle(color: Colors.white54),
                             // filled: true,
                              //fillColor: Color(0xFF0D4F50),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF005a5c),
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Odds field
                          Text(
                            'Odds',
                            style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'e.g. 2.45',
                              hintStyle: TextStyle(color: Colors.white54),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF005a5c),
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Match Result dropdown
                          Text(
                            'Match Result',
                            style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF005a5c),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            dropdownColor: Color(0xFF0D4F50),
                            hint: Text(
                              'Select an option',
                              style: TextStyle(color: Colors.white54),
                            ),
                            style: TextStyle(color: Colors.white),
                            items: ['Win', 'Loss', 'Pending'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 24),

                          // Save Now button
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                // Save logic here
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF6F978),
                                foregroundColor: Color(0xFF0A3D3E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Save Now',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                        ],
                      ),
                    );
                  },
                );
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
          )
        ],
      ),
    );
  }
}