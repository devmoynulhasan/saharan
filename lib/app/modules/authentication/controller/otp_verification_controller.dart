import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saharan/app/data/utilitis/custom_snackbar.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';
import '../../../data/app_const/app_const.dart';
import '../../../data/local_storage/local_storage.dart';
import '../../../data/network/base_client.dart';
import '../../../data/network/ent_point.dart';
import '../screen/sin_up_conform_password.dart';

class OtpVerificationController extends GetxController {
  final otpController = TextEditingController();

  final String email; // ✅ email যোগ করা হয়েছে
  OtpVerificationController({required this.email});

  var isLoading = false.obs;
  var isResendLoading = false.obs;
  var secondsRemaining = 60.obs;
  var enableResend = false.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    enableResend.value = false;
    secondsRemaining.value = 60;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        enableResend.value = true;
        timer.cancel();
      }
    });
  }

  Future<void> verifyOtp({required String otp}) async {
    isLoading.value = true;
    try {
      final token = LocalStorage.getData(key: AppConst.signUpVarificationToken);

      final response = await BaseClient.postRequest(
        api: EndPoint.signUpVerify,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        },
        body: {"otp": otp},
      );

      final responseBody = jsonDecode(response.body);

      if (responseBody['success'] == true) {
        showCustomSnackBar(
          message: 'OTP verified successfully!',
          type: SnackType.success,
        );
        LocalStorage.removeData(key: AppConst.signUpVarificationToken);

        // ✅ email pass করা হচ্ছে
        Get.offAll(() => SinUpConformPassword(email: email));
      } else {
        showCustomSnackBar(
          message: responseBody['message'] ?? 'Invalid OTP',
          type: SnackType.error,
        );
      }
    } catch (e) {
      showCustomSnackBar(
        message: 'Verification failed. Please try again.',
        type: SnackType.error,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendCode({required String email}) async {
    isResendLoading.value = true;
    try {
      final response = await BaseClient.postRequest(
        api: EndPoint.resendOtpURL,
        headers: {'Content-Type': 'application/json'},
        body: {"email": email},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        startTimer();
        final newToken = data['data']['verifyEmailToken'];
        LocalStorage.saveData(
          key: AppConst.signUpVarificationToken,
          data: newToken,
        );
        showCustomSnackBar(
          message: 'New OTP sent successfully',
          type: SnackType.success,
        );
      } else {
        showCustomSnackBar(
          message: data['message'] ?? 'Failed to resend OTP',
          type: SnackType.error,
        );
      }
    } catch (e) {
      showCustomSnackBar(
        message: 'Error resending OTP',
        type: SnackType.error,
      );
    } finally {
      isResendLoading.value = false;
    }
  }

  Future<void> forgotOtpVerify({required String otp}) async {
    isLoading.value = true;
    try {
      final token = LocalStorage.getData(key: AppConst.forgotToken);

      final response = await http.patch(
        Uri.parse(EndPoint.verifyOtpForForgotPasswordURL),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': token ?? '',
        },
        body: jsonEncode({"otp": otp}),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 && responseBody['success'] == true) {
        final resetToken = responseBody['data']['resetToken'];
        LocalStorage.saveData(key: AppConst.resetToken, data: resetToken);
        showCustomSnackBar(
          message: 'OTP verified. Now reset your password',
          type: SnackType.success,
        );
      } else {
        showCustomSnackBar(
          message: responseBody['message'] ?? 'Invalid OTP',
          type: SnackType.error,
        );
      }
    } catch (e) {
      showCustomSnackBar(
        message: 'Verification failed',
        type: SnackType.error,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> forgotResendCode({required String email}) async {
    isResendLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse(EndPoint.resendOtpURL),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: jsonEncode({"email": email}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        startTimer();
        final newToken = data['data']['resetToken'];
        LocalStorage.saveData(key: AppConst.forgotToken, data: newToken);
        showCustomSnackBar(
          message: 'New OTP sent to your email',
          type: SnackType.success,
        );
      } else {
        showCustomSnackBar(
          message: data['message'] ?? 'Failed to resend OTP',
          type: SnackType.error,
        );
      }
    } catch (e) {
      showCustomSnackBar(
        message: 'Error resending OTP',
        type: SnackType.error,
      );
    } finally {
      isResendLoading.value = false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    super.onClose();
  }
}