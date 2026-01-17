// import 'package:get/get.dart';
// import '../models/auth_response_model.dart';
// import '../providers/api_provider.dart';
// import '../../../core/constants/api_constants.dart';
//
// class AuthRepository {
//   final ApiProvider _apiProvider = ApiProvider();
//
//   // Sign Up - Password Step
//   Future<AuthResponseModel> signUpWithPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await _apiProvider.post(
//         ApiConstants.register,
//         body: {
//           'email': email,
//           'password': password,
//         },
//       );
//
//       return AuthResponseModel.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   // Update Profile (First Name, Last Name)
//   Future<AuthResponseModel> updateProfile({
//     required String firstName,
//     required String lastName,
//   }) async {
//     try {
//       final response = await _apiProvider.post(
//         ApiConstants.updateProfile,
//         requiresAuth: true,
//         body: {
//           'first_name': firstName,
//           'last_name': lastName,
//         },
//       );
//
//       return AuthResponseModel.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   // Login
//   Future<AuthResponseModel> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await _apiProvider.post(
//         ApiConstants.login,
//         body: {
//           'email': email,
//           'password': password,
//         },
//       );
//
//       return AuthResponseModel.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   // Verify OTP
//   Future<AuthResponseModel> verifyOtp({
//     required String email,
//     required String otp,
//   }) async {
//     try {
//       final response = await _apiProvider.post(
//         ApiConstants.verifyOtp,
//         body: {
//           'email': email,
//           'otp': otp,
//         },
//       );
//
//       return AuthResponseModel.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }