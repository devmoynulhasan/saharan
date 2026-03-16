import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PlanController extends GetxController {
  var selectedPlan = 'Monthly'.obs;

  final List<Map<String, dynamic>> plans = [
    {'title': 'Weekly', 'price': 'UGX 8000'},
    {'title': 'Monthly', 'price': 'UGX 32000'},
    {'title': 'Yearly', 'price': 'UGX 338000'},
  ];

  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }
}