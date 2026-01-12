import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Matches',style: GoogleFonts.orbitron(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFFEEEEF0)
                    ),),
                    GestureDetector(
                      child: Image.asset(
                        AssetPaths.match_icon,
                        height: 26,
                        width: 26,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 34,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xFFEF4444),

                        ) ,
                        child: Center(
                          child: Text('Live Now',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 14 ),

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),

                      Container(
                        height: 40,
                        width: 100,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xFF0A3D3E),

                        ) ,
                        child: Center(
                          child: Text('Tomorrow',
                            style: TextStyle(
                                color: Color(0xFF68B5B6),
                                fontSize: 14 ),

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 40,
                        width: 100,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xFF0A3D3E),

                        ) ,
                        child: Center(
                          child: Text('This Week',
                            style: TextStyle(color: Color(0xFF68B5B6),
                                fontSize: 14 ),

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 40,
                        width: 100,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xFF0A3D3E),

                        ) ,
                        child: Center(
                          child: Text('This Month',
                            style: TextStyle(color: Color(0xFF68B5B6),
                                fontSize: 14 ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Color(0xFF0A3D3E),
                  ),
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left section: Logo and text
                              Row(
                                children: [
                                  // Premier League Logo
                                  Container(
                                    width: 48,
                                    height: 48,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Image.network(
                                      'https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/Premier_League_Logo.svg/300px-Premier_League_Logo.svg.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Text
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Premier League',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'England',
                                        style: TextStyle(
                                          color: Color(0xFF99F6E4),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // Right section: Number and arrows
                              Row(
                                children: [
                                  // Number with arrow
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Row(
                                      children: [
                                        Text(
                                          '13',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Up arrow button
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.keyboard_arrow_up,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Color(0xFF00595B),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

      ),
    );
  }
}
