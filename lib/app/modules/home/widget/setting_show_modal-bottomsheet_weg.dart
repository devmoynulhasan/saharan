import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

// Controller
class BudgetSettingsController extends GetxController {
  var isSwitchOn1 = false.obs;
  var isSwitchOn2 = false.obs;
  var selectedDay = 'Monday'.obs;

  void toggleSwitch1(bool value) {
    isSwitchOn1.value = value;
  }

  void toggleSwitch2(bool value) {
    isSwitchOn2.value = value;
  }

  void updateSelectedDay(String day) {
    selectedDay.value = day;
  }

  void saveSettings() {
    Get.back();
    Get.snackbar(
      'Success',
      'Settings saved successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xFFF6F978),
      colorText: Color(0xFF0A3D3E),
    );
  }
}

// Main Settings Widget
class SettingShowModalBottomSheetWeg extends StatelessWidget {
  const SettingShowModalBottomSheetWeg({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BudgetSettingsController());

    return Container(
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
                'Budget Settings',
                style: GoogleFonts.orbitron(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
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

          // First Setting Card
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF184647),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Loss Limit Warnings',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Get alerts when approaching your budget limit',
                        style: TextStyle(
                          color: Color(0xFFB2B3BD),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => Switch(
                  value: controller.isSwitchOn1.value,
                  onChanged: controller.toggleSwitch1,
                  activeColor: Color(0xFF00595B),
                  activeTrackColor: Color(0xFFF6F978),
                  inactiveThumbColor: Color(0xFF00595B),
                  inactiveTrackColor: Color(0xFF215051),
                )),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Second Setting Card
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF184647),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Budget Notifications',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Receive daily budget summary notifications',
                        style: TextStyle(
                          color: Color(0xFFB2B3BD),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => Switch(
                  value: controller.isSwitchOn2.value,
                  onChanged: controller.toggleSwitch2,
                  activeColor: Color(0xFF00595B),
                  activeTrackColor: Color(0xFFF6F978),
                  inactiveThumbColor: Color(0xFF00595B),
                  inactiveTrackColor: Color(0xFF215051),
                )),
              ],
            ),
          ),

          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Budget reset day',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Select Day Button
          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                DaySelectionSheet(),
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
              );
            },
            child: Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF184647),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Text(
                      controller.selectedDay.value,
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    )),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Color(0xFF68B5B6),
                    )
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // Save Button
          Container(
            height: 52,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF6F978),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: controller.saveSettings,
              child: Text(
                'Save Settings',
                style: TextStyle(
                  color: Color(0xFF0A3D3E),
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
}

// Day Selection Sheet
class DaySelectionSheet extends StatelessWidget {
  const DaySelectionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BudgetSettingsController>();
    final tempSelectedDay = controller.selectedDay.value.obs;

    final List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return Container(
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
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFFFFFFFF),
                  size: 24,
                ),
              ),
              SizedBox(width: 16),
              Text(
                'Select Day',
                style: GoogleFonts.orbitron(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),

          // Days Grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: days.length,
            itemBuilder: (context, index) {
              final day = days[index];

              return Obx(() {
                final isSelected = day == tempSelectedDay.value;

                return GestureDetector(
                  onTap: () {
                    tempSelectedDay.value = day;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF184647),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? Color(0xFFF6F978) : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            day,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? Color(0xFFF6F978) : Color(0xFF68B5B6),
                                width: 2,
                              ),
                              color: isSelected ? Color(0xFFF6F978) : Colors.transparent,
                            ),
                            child: isSelected
                                ? Icon(
                              Icons.check,
                              size: 14,
                              color: Color(0xFF0A3D3E),
                            )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          ),

          SizedBox(height: 30),

          // Save Changes Button
          Container(
            height: 52,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF6F978),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                controller.updateSelectedDay(tempSelectedDay.value);
                Get.back();
              },
              child: Text(
                'Save Changes',
                style: TextStyle(
                  color: Color(0xFF0A3D3E),
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
}