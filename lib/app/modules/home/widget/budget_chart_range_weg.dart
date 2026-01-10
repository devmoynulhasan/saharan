import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Budget_Chart_Range_Weg extends StatelessWidget {
  const Budget_Chart_Range_Weg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Weekly Budget ",style: GoogleFonts.orbitron(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFFEEEEF0),

                    ),)
                  ],
                ),
                // Notification Icon
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Color(0xFFF6F978),
                      size: 24,
                    ),
                  ),
                ),
              ],
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
    );
  }
}
