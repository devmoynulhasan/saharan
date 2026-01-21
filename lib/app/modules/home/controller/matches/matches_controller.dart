import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MatchesController extends GetxController {
  // Observable variables
  final selectedIndex = 0.obs;
  final selectedDate = DateTime.now().obs;
  final weekDates = <DateTime>[].obs;

  // Expandable league states
  final isPremierLeagueExpanded = true.obs;
  final isLaLigaExpanded = false.obs;
  final isBundesligaExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeWeekDates();
  }

  /// Initialize the week dates starting from Monday
  void _initializeWeekDates() {
    DateTime now = DateTime.now();
    int currentWeekday = now.weekday;

    // Calculate the start of the week (Monday)
    DateTime startOfWeek = now.subtract(Duration(days: currentWeekday - 1));

    // Generate 7 days from start of week
    weekDates.value = List.generate(
      7,
          (index) => startOfWeek.add(Duration(days: index)),
    );
  }

  /// Check if a date is today
  bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
  }

  /// Select a specific date
  void selectDate(int index, DateTime date) {
    selectedIndex.value = index;
    selectedDate.value = date;
  }

  /// Toggle Premier League expansion
  void togglePremierLeague() {
    isPremierLeagueExpanded.value = !isPremierLeagueExpanded.value;
  }

  /// Toggle LaLiga expansion
  void toggleLaLiga() {
    isLaLigaExpanded.value = !isLaLigaExpanded.value;
  }

  /// Toggle Bundesliga expansion
  void toggleBundesliga() {
    isBundesligaExpanded.value = !isBundesligaExpanded.value;
  }

  /// Format date for display
  String formatDate(DateTime date, String format) {
    return DateFormat(format).format(date);
  }

  /// Get the count of matches for a league (placeholder - replace with actual data)
  int getMatchCount(String league) {
    // This should be replaced with actual match data from your API/database
    return 13;
  }
}