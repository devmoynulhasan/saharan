import 'package:flutter/material.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class Deshbord_Spending_Week_Weg extends StatelessWidget {
  const Deshbord_Spending_Week_Weg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // First Match Card
          Container(
            height: 130,
            width: 320, // Fixed width instead of double.infinity
            decoration: BoxDecoration(
              color: Color(0xFF0A3D3E),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date and Time
                  Row(
                    children: [
                      Image.asset(
                        AssetPaths.match_delels_clender,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "7th Jan 2026, 02:00 AM",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Newcastle United
                  Row(
                    children: [
                      Image.asset(
                        AssetPaths.newcastle_united,
                        height: 28,
                        width: 28,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Newcastle United",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  // Manchester United
                  Row(
                    children: [
                      Image.asset(
                        AssetPaths.manchester_united,
                        height: 28,
                        width: 28,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Manchester United",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 12),

          // Second Match Card
          Container(
            height: 130,
            width: 320,
            decoration: BoxDecoration(
              color: Color(0xFF0A3D3E),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date and Time
                  Row(
                    children: [
                      Image.asset(
                        AssetPaths.match_delels_clender,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "7th Jan 2026, 02:00 AM",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Newcastle United

                  Row(
                    children: [
                      Image.asset(
                        AssetPaths.newcastle_united,
                        height: 28,
                        width: 28,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Newcastle United",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  // Manchester United
                  Row(
                    children: [
                      Image.asset(
                        AssetPaths.manchester_united,
                        height: 28,
                        width: 28,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Manchester United",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 12),
        ],
      ),
    );
  }
}