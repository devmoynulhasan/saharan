import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import 'package:saharan/app/modules/home/widget/budget/budget_premier_league_weg.dart';
import 'package:saharan/app/modules/home/widget/desbord/deshbord_spending_week_weg.dart';
import 'package:saharan/resource/app_images/app_images.dart';

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
                  // ─── App Bar ───
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(AssetPaths.splash_image_one, height: 50, width: 50),
                          const SizedBox(width: 10),
                          Image.asset(AssetPaths.splash_image_two, height: 40, width: 140),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(AssetPaths.favourite, height: 24, width: 24, color: Colors.white),
                            const SizedBox(width: 15),
                            const Icon(Icons.notifications_outlined, color: Colors.white, size: 24),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ─── Weekly Budget Card ───
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
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
                          const SizedBox(height: 20),

                          // ─── Gauge Chart ───
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final double w = constraints.maxWidth;
                              final double h = 200.0;
                              const double strokeWidth = 45.0;
                              const double value = 0.75;

                              // Arc center এবং radius (painter এর সাথে same)
                              final double cx = w / 2;
                              final double cy = h;
                              final double radius = w / 2 - strokeWidth / 2;

                              // ── 75% label: yellow arc এর মাঝে (angle = π + π*0.375)
                              final double angle75 = pi + pi * 0.375;
                              final double x75 = cx + radius * cos(angle75) - 15;
                              final double y75 = cy + radius * sin(angle75) - 10;

                              // ── 25% label: green arc এর মাঝে (angle = π + π*0.875)
                              final double angle25 = pi + pi * 0.875;
                              final double x25 = cx + radius * cos(angle25) - 15;
                              final double y25 = cy + radius * sin(angle25) - 10;

                              return SizedBox(
                                width: w,
                                height: h,
                                child: Stack(
                                  children: [
                                    // ── Chart ──
                                    CustomPaint(
                                      size: Size(w, h),
                                      painter: HalfDonutPainter(value: value),
                                    ),

                                    // ── 75% label ──
                                    Positioned(
                                      left: x75,
                                      top: y75,
                                      child: const Text(
                                        '75%',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF032526),
                                        ),
                                      ),
                                    ),

                                    // ── 25% label ──
                                    Positioned(
                                      left: x25,
                                      top: y25,
                                      child: const Text(
                                        '25%',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                    // ── Center: 400 UGX + Left more ──
                                    Positioned(
                                      bottom: 40,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            '400 UGX',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Left more',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 20),

                          // ─── Used & Limit ───
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: const [
                                  Text("1600 UGX", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                                  SizedBox(height: 4),
                                  Text("Used", style: TextStyle(fontSize: 14, color: Colors.white70)),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text("2000 UGX", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                                  SizedBox(height: 4),
                                  Text("Limit", style: TextStyle(fontSize: 14, color: Colors.white70)),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),
                          const Divider(color: Color(0xFF00595B), thickness: 1),
                          const SizedBox(height: 16),

                          // ─── Safe & Adjust Limit ───
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 44,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF184647),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Safe', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: const [
                                    Text('Adjust Limit', style: TextStyle(color: Color(0xFFF6F978), fontWeight: FontWeight.w600, fontSize: 16)),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFF6F978), size: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: const [
                      Text("Favorite team's matches", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 15),

                  Deshbord_Spending_Week_Weg(),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Spending this week", style: GoogleFonts.sourceSans3(fontWeight: FontWeight.bold, fontSize: 18, color: const Color(0xFFEEEEF0))),
                      GestureDetector(
                        onTap: () {},
                        child: Text("See all", style: GoogleFonts.sourceSans3(fontSize: 18, color: const Color(0xFFF6F978), fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  PremirerLeagueWeg(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HalfDonutPainter extends CustomPainter {
  final double value;
  HalfDonutPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 45;
    final double cx = size.width / 2;
    final double cy = size.height;
    final double radius = size.width / 2 - strokeWidth / 2;

    final Rect rect = Rect.fromCircle(center: Offset(cx, cy), radius: radius);

    // Background arc (green)
    canvas.drawArc(
      rect, pi, pi, false,
      Paint()
        ..color = const Color(0xFF00595B)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt,
    );

    // Foreground arc (yellow)
    canvas.drawArc(
      rect, pi, pi * value, false,
      Paint()
        ..color = const Color(0xFFF6F978)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt,
    );
  }

  @override
  bool shouldRepaint(HalfDonutPainter old) => old.value != value;
}