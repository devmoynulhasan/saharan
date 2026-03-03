import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;

import '../app_const/app_const.dart';
import '../local_storage/local_storage.dart';

class BaseClient {
  // Default headers for JSON requests
  static const Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// GET request
  static Future<http.Response> getRequest({
    required String api,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint("API Hit: $api");
      debugPrint("Params: $params");
      final response = await http.get(
        Uri.parse(api).replace(queryParameters: params),
        headers: await _getHeaders(headers),
      );
      return await _handleResponseWithRetry(
        response,
            () => getRequest(api: api, params: params, headers: headers),
      );
    } catch (e) {
      debugPrint("GET Request Error: $e");
      rethrow;
    }
  }

  /// POST request (JSON)
  static Future<http.Response> postRequest({
    required String api,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint("API Hit: $api");
      debugPrint("Body: $body");
      final response = await http.post(
        Uri.parse(api),
        body: body != null ? jsonEncode(body) : null,
        headers: await _getHeaders(headers),
      );
      return await _handleResponseWithRetry(
        response,
            () => postRequest(api: api, body: body, headers: headers),
      );
    } catch (e) {
      debugPrint("POST Request Error: $e");
      rethrow;
    }
  }

  /// POST request (Multipart)
  static Future<http.Response> postMultipartRequest({
    required String api,
    Map<String, String>?
    fields, // Change to Map<String, String> since we're sending JSON string
    List<http.MultipartFile>? files,
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint("API Hit (Multipart): $api");
      debugPrint("Fields: $fields");
      debugPrint("Files: ${files?.map((f) => f.filename).toList()}");

      final request = http.MultipartRequest('POST', Uri.parse(api));
      request.headers.addAll(await _getHeaders(headers, isMultipart: true));

      if (fields != null) {
        request.fields.addAll(fields); // Add the JSON-encoded 'data' field
      }

      if (files != null) {
        request.files.addAll(files);
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      debugPrint("Multipart POST Response: ${response.statusCode}");
      debugPrint("Multipart POST Response Body: ${response.body}");
      return await _handleResponseWithRetry(
        response,
            () => postMultipartRequest(
          api: api,
          fields: fields,
          files: files,
          headers: headers,
        ),
      );
    } catch (e) {
      debugPrint("Multipart POST Request Error: $e");
      rethrow;
    }
  }

  /// PUT request (JSON)
  static Future<http.Response> putRequest({
    required String api,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint("API Hit: $api");
      debugPrint("Body: $body");
      final response = await http.put(
        Uri.parse(api),
        body: body != null ? jsonEncode(body) : null,
        headers: await _getHeaders(headers),
      );
      return await _handleResponseWithRetry(
        response,
            () => putRequest(api: api, body: body, headers: headers),
      );
    } catch (e) {
      debugPrint("PUT Request Error: $e");
      rethrow;
    }
  }

  /// PUT request (Multipart)
  static Future<http.Response> putMultipartRequest({
    required String api,
    Map<String, String>? fields,
    List<http.MultipartFile>? files,
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint("API Hit (Multipart): $api");
      debugPrint("Fields: $fields");
      debugPrint("Files: ${files?.map((f) => f.filename).toList()}");

      final request = http.MultipartRequest('PUT', Uri.parse(api));
      request.headers.addAll(await _getHeaders(headers, isMultipart: true));

      if (fields != null) {
        request.fields.addAll(fields);
      }

      if (files != null) {
        request.files.addAll(files);
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      debugPrint("Multipart PUT Response: ${response.statusCode}");
      return await _handleResponseWithRetry(
        response,
            () => putMultipartRequest(
          api: api,
          fields: fields,
          files: files,
          headers: headers,
        ),
      );
    } catch (e) {
      debugPrint("Multipart PUT Request Error: $e");
      rethrow;
    }
  }

  /// DELETE request
  static Future<http.Response> deleteRequest({
    required String api,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint("API Hit: $api");
      debugPrint("Body: $body");
      final response = await http.delete(
        Uri.parse(api),
        body: body != null ? jsonEncode(body) : null,
        headers: await _getHeaders(headers),
      );
      return await _handleResponseWithRetry(
        response,
            () => deleteRequest(api: api, body: body, headers: headers),
      );
    } catch (e) {
      debugPrint("DELETE Request Error: $e");
      rethrow;
    }
  }

  /// PATCH request
  static Future<http.Response> patchRequest({
    required String api,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint("API Hit: $api");
      debugPrint("Body: $body");
      final response = await http.patch(
        Uri.parse(api),
        body: body != null ? jsonEncode(body) : null,
        headers: await _getHeaders(headers),
      );
      return await _handleResponseWithRetry(
        response,
            () => patchRequest(api: api, body: body, headers: headers),
      );
    } catch (e) {
      debugPrint("PATCH Request Error: $e");
      rethrow;
    }
  }

  /// Get headers with access token
  static Future<Map<String, String>> _getHeaders(
      Map<String, String>? headers, {
        bool isMultipart = false,
      }) async {
    final accessToken = await LocalStorage.getData(key: AppConst.accessToken);
    final authHeader =
    accessToken != null ? {'Authorization': '$accessToken'} : {};
    return {
      if (!isMultipart) ..._defaultHeaders,
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      ...?headers,
      ...authHeader,
    };
  }

  /// Refresh access token
  static Future<bool> _refreshAccessToken() async {
    try {
      final refreshToken = await LocalStorage.getData(
        key: AppConst.refreshToken,
      );
      if (refreshToken == null) {
        debugPrint("No refresh token available");
        logout();
        return false;
      }

      debugPrint("Attempting to refresh token");
      final response = await http.post(
        Uri.parse('EndPoint.refreshTokenURL'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refresh': refreshToken}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          final newAccessToken = data['data']['access'];
          final newRefreshToken = data['data']['refresh'];

          if (newAccessToken != null) {
            await LocalStorage.saveData(
              key: AppConst.accessToken,
              data: newAccessToken,
            );
            if (newRefreshToken != null) {
              await LocalStorage.saveData(
                key: AppConst.refreshToken,
                data: newRefreshToken,
              );
            }
            debugPrint("Token refreshed successfully");
            return true;
          }
        }
      }
      debugPrint("Failed to refresh token: ${response.body}");
      logout();
      return false;
    } catch (e) {
      debugPrint("Refresh Token Error: $e");
      logout();
      return false;
    }
  }

  /// Handle HTTP response with retry logic
  static Future<http.Response> _handleResponseWithRetry(
      http.Response response,
      Future<http.Response> Function() retryRequest,
      ) async {
    try {
      debugPrint('StatusCode: ${response.statusCode}');
      debugPrint('Response: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode <= 210) {
        debugPrint('SuccessCode: ${response.statusCode}');
        debugPrint('SuccessResponse: ${response.body}');
        return response;
      } else if (response.statusCode == 401) {
        String msg = "Unauthorized: Please log in again";
        if (response.body.isNotEmpty) {
          final decoded = jsonDecode(response.body);
          if (decoded['errors'] is Map) {
            msg = decoded['errors']['detail'] ?? decoded['message'] ?? msg;
          } else {
            msg = decoded['message'] ?? msg;
          }
        }

        // Attempt to refresh token
        final refreshed = await _refreshAccessToken();
        if (refreshed) {
          // Retry the original request with the new token
          final retryResponse = await retryRequest();
          return await _handleResponseWithRetry(retryResponse, retryRequest);
        } else {
          throw msg; // Throw the message directly to avoid nested Exception
        }
      } else if (response.statusCode == 400 ||
          response.statusCode == 403 ||
          response.statusCode == 406) {
        String msg = "Something went wrong";
        if (response.body.isNotEmpty) {
          final decoded = jsonDecode(response.body);
          msg = decoded['message'] ?? msg;
        }
        Get.snackbar('Error', msg, snackPosition: SnackPosition.BOTTOM);
        throw msg;
      } else if (response.statusCode == 404) {
        String msg = "Page Not Found";
        if (response.body.isNotEmpty) {
          final decoded = jsonDecode(response.body);
          msg = decoded['message'] ?? msg;
        }
        Get.snackbar('Error', msg, snackPosition: SnackPosition.BOTTOM);
        throw msg;
      } else if (response.statusCode == 500) {
        Get.snackbar('Error', 'Server Error', snackPosition: SnackPosition.BOTTOM);
        // CustomToast.showToast(message: "Error : Server Error", isError: true);
        throw "Server Error";
      } else {
        String msg = "Something went wrong";
        if (response.body.isNotEmpty) {
          final decoded = jsonDecode(response.body);
          if (decoded['errors'] is String) {
            msg = decoded['errors'];
          } else if (decoded['errors'] is Map) {
            msg = decoded['errors']['detail'] ?? decoded['message'] ?? msg;
          } else {
            msg = decoded['message'] ?? msg;
          }
        }
        // CustomToast.showToast(message: "Error : $msg", isError: true);
        Get.snackbar('Error', msg, snackPosition: SnackPosition.BOTTOM);
        throw msg;
      }
    } on SocketException {
      // CustomToast.showToast(
      //   message: "Error : No internet connection",
      //   isError: true,
      // );
      Get.snackbar('Error', 'No internet connection', snackPosition: SnackPosition.BOTTOM);
      throw "No internet connection";
    } on FormatException {
      // CustomToast.showToast(
      //   message: "Error : Bad response format",
      //   isError: true,
      // );
      Get.snackbar('Error', 'Bad response format', snackPosition: SnackPosition.BOTTOM);
      throw "Bad response format";
    } catch (e) {
      // CustomToast.showToast(message: "Error : $e", isError: true);
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
      throw e.toString();
    }
  }

  /// Handle HTTP response (kept for compatibility)
  static Future<http.Response> handleResponse(http.Response response) async {
    return _handleResponseWithRetry(response, () => Future.value(response));
  }

  /// Logout user
  static void logout() {
    LocalStorage.removeData(key: AppConst.accessToken);
    LocalStorage.removeData(key: AppConst.refreshToken);
    // Get.offAll(() => SignInView());
  }
}