import 'package:get/get.dart';

class FavoritesTeamController extends GetxController {
  var selectedIndex = 0.obs;

  void selectLeague(int index) {
    selectedIndex.value = index;
  }

}