// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:saharan/app/modules/authentication/screen/forgot_conform_password.dart';
//
// class ForgotOtpController extends GetxController {
//   final String email;
//   ForgotOtpController({required this.email});
//
//   var currentOtp = ''.obs;
//   var contactType = ''.obs;
//   var contactValue = ''.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Get arguments from previous screen
//     final args = Get.arguments;
//     if (args != null) {
//       contactType.value = args['type'] ?? 'email';
//       contactValue.value = args['value'] ?? 'your account';
//     }
//   }
//
//   void updateOtp(String value) {
//     currentOtp.value = value;
//
//     // Automatically navigate when OTP is complete
//     if (value.length == 4) {
//       verifyOTP();
//     }
//   }
//
//   void verifyOTP() {
//     if (currentOtp.value.length == 4) {
//       // Here you can add your API call to verify OTP
//       // For now, we'll just navigate to the next screen
//       Get.to(() => ForgotConformPassword(), arguments: {
//         'otp': currentOtp.value,
//         'type': contactType.value,
//         'value': contactValue.value,
//       });
//     } else {
//       Get.snackbar(
//         'Error',
//         'Please enter the complete 6-digit OTP',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Get.theme.colorScheme.error.withOpacity(0.7),
//         colorText: Colors.white,
//         margin: EdgeInsets.all(16),
//       );
//     }
//   }
//
//   void resendOTP() {
//     // Add your API call to resend OTP here
//     currentOtp.value = ''; // Clear current OTP
//
//     Get.snackbar(
//       'Success',
//       'OTP has been resent to your ${contactType.value}',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.green.withOpacity(0.7),
//       colorText: Colors.white,
//       margin: EdgeInsets.all(16),
//     );
//   }
// }