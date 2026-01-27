import 'package:get/get.dart';
import 'package:saharan/app/modules/home/controller/matches/matches_live_controller.dart';

class MatchesLiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchesLiveController>(() => MatchesLiveController());
  }
}