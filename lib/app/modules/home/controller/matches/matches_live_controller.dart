import 'package:get/get.dart';

class MatchesLiveController extends GetxController {
  // Date selection
  List<DateTime> weekDates = List.generate(7, (index) {
    return DateTime.now().add(Duration(days: index));
  });

  // Expand/Collapse states for different leagues
  var isPremierLeagueExpanded = true.obs;
  var isLaLigaExpanded = true.obs;

  // Toggle methods
  void togglePremierLeague() {
    isPremierLeagueExpanded.value = !isPremierLeagueExpanded.value;
  }

  void toggleLaLiga() {
    isLaLigaExpanded.value = !isLaLigaExpanded.value;
  }

  // formatDate method
  String formatDate(DateTime date, String format) {
    if (format == 'dd') {
      return date.day.toString().padLeft(2, '0');
    } else if (format == 'EEE') {
      List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return days[date.weekday - 1];
    }
    return '';
  }
}