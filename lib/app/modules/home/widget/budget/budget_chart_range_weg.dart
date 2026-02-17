import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Budget_Chart_Range_Weg extends StatefulWidget {
  const Budget_Chart_Range_Weg({super.key});

  @override
  State<Budget_Chart_Range_Weg> createState() => _Budget_Chart_Range_WegState();
}

class _Budget_Chart_Range_WegState extends State<Budget_Chart_Range_Weg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
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
                Text(
                  "Weekly Budget ",
                  style: GoogleFonts.orbitron(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFFEEEEF0),
                  ),
                ),
                GestureDetector(
                  onTap: () {

                    // showModalBottomSheet(
                    //   context: context,
                    //   backgroundColor: Colors.transparent,
                    //   isScrollControlled: true,
                    //   builder: (BuildContext context) {
                    //     return Padding(
                    //       padding: EdgeInsets.only(
                    //         bottom: MediaQuery.of(context).viewInsets.bottom,
                    //       ),
                    //       child: BudgetSetupSheet(),
                    //     );
                    //   },
                    // );

                  },
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
                      ],
                      annotations: <GaugeAnnotation>[
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
                      style: TextStyle(fontSize: 14, color: Colors.white70),
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
                      style: TextStyle(fontSize: 14, color: Colors.white70),
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

// Separate StatefulWidget for the Bottom Sheet
class BudgetSetupSheet extends StatefulWidget {
  const BudgetSetupSheet({super.key});

  @override
  State<BudgetSetupSheet> createState() => _BudgetSetupSheetState();
}

class _BudgetSetupSheetState extends State<BudgetSetupSheet> {
  final TextEditingController _budgetController = TextEditingController();
  bool _isButtonEnabled = false;
  int? _selectedPreset;

  @override
  void initState() {
    super.initState();
    _budgetController.addListener(() {
      setState(() {
        _isButtonEnabled = _budgetController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _budgetController.dispose();
    super.dispose();
  }

  void _selectPreset(int amount) {
    setState(() {
      _selectedPreset = amount;
      _budgetController.text = amount.toString();
      _isButtonEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF0A3D3E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Budget Set Up',
                style: GoogleFonts.orbitron(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFFFFFFFF),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Color(0xFF215051)),
          SizedBox(height: 10),
          TextFormField(
            controller: _budgetController,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter budget amount',
              hintStyle: TextStyle(color: Colors.white54),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF215051)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFF6F978), width: 2),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Quick Presets',
                style: GoogleFonts.sourceSans3(
                  color: Color(0xFFFFFFFF),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPresetButton(50000),
              _buildPresetButton(100000),
              _buildPresetButton(200000),
            ],
          ),
          SizedBox(height: 80),
          Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
              color: _isButtonEnabled
                  ? Color(0xFFF6F978)
                  : Color(0xFF215051),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isButtonEnabled
                    ? Color(0xFFF6F978)
                    : Color(0xFF215051),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _isButtonEnabled
                  ? () {
                Navigator.pop(context);
              }
                  : null,
              child: Text(
                'Set Budget',
                style: TextStyle(
                  color: _isButtonEnabled
                      ? Color(0xFF0A3D3E)
                      : Colors.white54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPresetButton(int amount) {
    bool isSelected = _selectedPreset == amount;
    return Expanded(
      child: GestureDetector(
        onTap: () => _selectPreset(amount),
        child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Color(0xFF0A3D3E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Color(0xFFF6F978) : Color(0xFF215051),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${amount ~/ 1000}k',
                  style: TextStyle(
                    color: isSelected ? Color(0xFFF6F978) : Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'UGX',
                  style: TextStyle(
                    color: isSelected ? Color(0xFFF6F978) : Color(0xFFFFFFFF),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}