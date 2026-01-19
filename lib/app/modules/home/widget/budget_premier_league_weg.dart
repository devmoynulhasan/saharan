import 'package:flutter/material.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class PremirerLeagueWeg extends StatelessWidget {
  const PremirerLeagueWeg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF0D3334),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Header Row with spaceBetween
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Premier League + Date in Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetPaths.premier_league,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Premier League',
                            style: TextStyle(
                              color: Color(0xFFEEEEF0),
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "01 Dec 2025, 06:00 PM",
                        style: TextStyle(
                          color: Color(0xFF68B5B6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Right side: Pending Status
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF184647),
                    ),
                    child: Center(
                      child: Text(
                        'Pending',
                        style: TextStyle(
                          color: Color(0xFF68B5B6),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Divider(
                color: Color(0xFF215051),
                thickness: 1,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Manchester United and Newcastle United in Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetPaths.manchester_united,
                            height: 32,
                            width: 32,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Manchester United',
                            style: TextStyle(
                              color: Color(0xFFEEEEF0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Image.asset(
                            AssetPaths.newcastle_united,
                            height: 32,
                            width: 32,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Newcastle United',
                            style: TextStyle(
                              color: Color(0xFFEEEEF0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Right side: Amount
                  Text(
                    '2000 UGX',
                    style: TextStyle(
                      color: Color(0xFFEEEEF0),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF0D3334),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Header Row with spaceBetween
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetPaths.premier_league,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Premier League',
                            style: TextStyle(
                              color: Color(0xFFEEEEF0),
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "01 Dec 2025, 06:00 PM",
                        style: TextStyle(
                          color: Color(0xFF68B5B6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Right side: Pending Status
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF184647),
                    ),
                    child: Center(
                      child: Text(
                        'Won',
                        style: TextStyle(
                          color: Color(0xFF10B981),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Divider(
                color: Color(0xFF215051),
                thickness: 1,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Manchester United and Newcastle United in Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetPaths.manchester_united,
                            height: 32,
                            width: 32,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Manchester United',
                            style: TextStyle(
                              color: Color(0xFFEEEEF0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Image.asset(
                            AssetPaths.newcastle_united,
                            height: 32,
                            width: 32,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Newcastle United',
                            style: TextStyle(
                              color: Color(0xFFEEEEF0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Right side: Amount
                  Text(
                    '2000 UGX',
                    style: TextStyle(
                      color: Color(0xFFEEEEF0),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12,),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF0D3334),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Header Row with spaceBetween
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Premier League + Date in Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetPaths.premier_league,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Premier League',
                            style: TextStyle(
                              color: Color(0xFFEEEEF0),
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "01 Dec 2025, 06:00 PM",
                        style: TextStyle(
                          color: Color(0xFF68B5B6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Right side: Pending Status
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF184647),
                    ),
                    child: Center(
                      child: Text(
                        'Lost',
                        style: TextStyle(
                          color: Color(0xFFEF4444),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Divider(
                color: Color(0xFF215051),
                thickness: 1,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Manchester United and Newcastle United in Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetPaths.manchester_united,
                            height: 32,
                            width: 32,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Manchester United',
                            style: TextStyle(
                              color: Color(0xFFEEEEF0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Image.asset(
                            AssetPaths.newcastle_united,
                            height: 32,
                            width: 32,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Newcastle United',
                            style: TextStyle(
                              color: Color(0xFFEEEEF0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Right side: Amount
                  Text(
                    '2000 UGX',
                    style: TextStyle(
                      color: Color(0xFFEEEEF0),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}