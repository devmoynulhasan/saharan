// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:saharan/app/modules/authentication/screen/sin_up_conform_password.dart';
//
// class OtpVerifyController extends GetxController {
//   final otpController = TextEditingController();
//
//   // ✅ email receive করার জন্য
//   final String email;
//   OtpVerifyController({required this.email});
//
//   var isLoading = false.obs;
//   var otpCode = ''.obs;
//   var isOtpComplete = false.obs;
//
//   var canResend = false.obs;
//   var resendTimer = 60.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     startResendTimer();
//   }
//
//   void startResendTimer() {
//     canResend.value = false;
//     resendTimer.value = 60;
//     Future.delayed(Duration(seconds: 1), () {
//       _decrementTimer();
//     });
//   }
//
//   void _decrementTimer() {
//     if (resendTimer.value > 0) {
//       resendTimer.value--;
//       Future.delayed(Duration(seconds: 1), () {
//         _decrementTimer();
//       });
//     } else {
//       canResend.value = true;
//     }
//   }
//
//   void onOtpChanged(String value) {
//     otpCode.value = value;
//     isOtpComplete.value = value.length == 6;
//     if (value.length == 4) {
//       verifyOtp();
//     }
//   }
//
//   void verifyOtp() {
//     if (otpCode.value.length != 4) {
//       Get.snackbar(
//         'Error',
//         'Please enter 6-digit OTP code',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Color(0xFFFF6B6B),
//         colorText: Colors.white,
//         margin: EdgeInsets.all(16),
//         borderRadius: 12,
//         duration: Duration(seconds: 2),
//       );
//       return;
//     }
//
//     isLoading.value = true;
//
//     Future.delayed(Duration(seconds: 2), () {
//       isLoading.value = false;
//
//       if (otpCode.value.length == 4) {
//         Get.snackbar(
//           'Success',
//           'OTP verified successfully',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Color(0xFF4CAF50),
//           colorText: Colors.white,
//           margin: EdgeInsets.all(16),
//           borderRadius: 12,
//           duration: Duration(seconds: 2),
//         );
//
//         Future.delayed(Duration(milliseconds: 500), () {
//           Get.to(() => SinUpConformPassword());
//         });
//       } else {
//         Get.snackbar(
//           'Invalid OTP',
//           'The OTP you entered is incorrect',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Color(0xFFFF6B6B),
//           colorText: Colors.white,
//           margin: EdgeInsets.all(16),
//           borderRadius: 12,
//           duration: Duration(seconds: 2),
//         );
//       }
//     });
//   }
//
//   void resendOtp() {
//     if (!canResend.value) {
//       Get.snackbar(
//         'Please Wait',
//         'You can resend OTP after ${resendTimer.value} seconds',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Color(0xFFFF9800),
//         colorText: Colors.white,
//         margin: EdgeInsets.all(16),
//         borderRadius: 12,
//         duration: Duration(seconds: 2),
//       );
//       return;
//     }
//
//     isLoading.value = true;
//
//     Future.delayed(Duration(seconds: 1), () {
//       isLoading.value = false;
//
//       Get.snackbar(
//         'OTP Sent',
//         'A new OTP has been sent to your email',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Color(0xFF4CAF50),
//         colorText: Colors.white,
//         margin: EdgeInsets.all(16),
//         borderRadius: 12,
//         duration: Duration(seconds: 2),
//       );
//
//       otpController.clear();
//       otpCode.value = '';
//       isOtpComplete.value = false;
//       startResendTimer();
//     });
//   }
//
//   @override
//   void onClose() {
//     otpController.dispose();
//     super.onClose();
//   }
// }