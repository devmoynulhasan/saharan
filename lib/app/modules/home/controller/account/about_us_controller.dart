import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../data/network/ent_point.dart';

class PagesController extends GetxController {
  var aboutUs = ''.obs;
  var privacyPolicy = ''.obs;   // ✅ নতুন
  var termsCondition = ''.obs;  // ✅ পরে Terms এর জন্য
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPages();
    super.onInit();
  }

  Future<void> fetchPages() async {
    try {
      isLoading(true);
      print('========= API CALL START =========');

      final response = await http.get(
        Uri.parse(EndPoint.aboutUsURL),
      );

      print('========= STATUS CODE: ${response.statusCode} =========');
      print('========= RESPONSE: ${response.body} =========');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          aboutUs.value        = data['data'][0]['about_us'];
          privacyPolicy.value  = data['data'][0]['privacy_policy'];
          termsCondition.value = data['data'][0]['terms_condition'];
          print('========= DATA SET SUCCESSFULLY =========');
        }
      }
    } catch (e) {
      print('========= ERROR: $e =========');
    } finally {
      isLoading(false);
    }
  }
}