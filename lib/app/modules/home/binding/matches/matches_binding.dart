import 'package:get/get.dart';
import 'package:saharan/app/modules/home/controller/matches/matches_controller.dart';

class MatchesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchesController>(() => MatchesController());
  }
}