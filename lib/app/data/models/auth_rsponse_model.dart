// import 'user_model.dart';
//
// class AuthResponseModel {
//   final bool success;
//   final String message;
//   final String? token;
//   final UserModel? user;
//
//   AuthResponseModel({
//     required this.success,
//     required this.message,
//     this.token,
//     this.user,
//   });
//
//   factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
//     return AuthResponseModel(
//       success: json['success'] ?? false,
//       message: json['message'] ?? '',
//       token: json['token'],
//       user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
//     );
//   }
// }