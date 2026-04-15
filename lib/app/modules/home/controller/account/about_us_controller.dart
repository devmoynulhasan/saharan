import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../data/network/ent_point.dart';

class AboutUsController extends GetxController {
  var aboutUs = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPages();
    super.onInit();
  }

  Future<void> fetchPages() async {
    try {
      isLoading(true);
      print('>>> API CallS');

      final response = await http.get(
        Uri.parse(EndPoint.aboutUsURL),
      );

      print('>>> Status Code: ${response.statusCode}');
      print('>>> Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          aboutUs.value = data['data'][0]['about_us'];
          print('>>> About Us: ${aboutUs.value}');
        }
      }
    } catch (e) {
      print('>>> Error: $e');
    } finally {
      isLoading(false);
    }
  }
}