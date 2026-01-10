import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
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
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 320, // height কমানো হয়েছে
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
                          SizedBox(height: 10),
                          Expanded(
                            child: Center(
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
                                      thickness: 42,
                                      color: Color(0xFF00595b),
                                    ),
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: 75,
                                        width: 42,
                                        color: Color(0xFFf6f978),
                                      ),
                                      // Marker pointer added here
                                      MarkerPointer(
                                        value: 75,
                                        markerType: MarkerType.circle,
                                        markerHeight: 20,
                                        markerWidth: 20,
                                        color: Colors.white,
                                        borderWidth: 3,
                                        borderColor: Color(0xFFf6f978),
                                      ),
                                    ],
                                    annotations: <GaugeAnnotation>[
                                      // Center annotation (75%)
                                      GaugeAnnotation(
                                        widget: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '75%',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              '400 UGX',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'Left more',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                        angle: 90,
                                        positionFactor: 0.4,
                                      ),
                                      // Right side annotation (25%)
                                      GaugeAnnotation(
                                        widget: Text(
                                          '25%',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        angle: 0,
                                        positionFactor: 0.8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "1600 UGX",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Used",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white70),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "2000 UGX",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Limit",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white70),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}