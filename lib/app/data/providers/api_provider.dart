// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import '../../../core/constants/api_constants.dart';
// import '../../../core/utils/storage_service.dart';
//
// class ApiProvider {
//   final StorageService _storage = Get.find<StorageService>();
//
//   Future<Map<String, dynamic>> post(
//       String endpoint, {
//         Map<String, dynamic>? body,
//         bool requiresAuth = false,
//       }) async {
//     try {
//       final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
//       final token = requiresAuth ? _storage.getToken() : null;
//
//       print('POST Request: $url');
//       print('Body: $body');
//
//       final response = await http.post(
//         url,
//         headers: ApiConstants.getHeaders(token: token),
//         body: json.encode(body),
//       );
//
//       print('Response Status: ${response.statusCode}');
//       print('Response Body: ${response.body}');
//
//       return _handleResponse(response);
//     } catch (e) {
//       print('API Error: $e');
//       throw Exception('Network error: $e');
//     }
//   }
//
//   Future<Map<String, dynamic>> get(
//       String endpoint, {
//         bool requiresAuth = false,
//       }) async {
//     try {
//       final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
//       final token = requiresAuth ? _storage.getToken() : null;
//
//       final response = await http.get(
//         url,
//         headers: ApiConstants.getHeaders(token: token),
//       );
//
//       return _handleResponse(response);
//     } catch (e) {
//       throw Exception('Network error: $e');
//     }
//   }
//
//   Map<String, dynamic> _handleResponse(http.Response response) {
//     final data = json.decode(response.body);
//
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       return data;
//     } else {
//       throw Exception(data['message'] ?? 'Something went wrong');
//     }
//   }
// }