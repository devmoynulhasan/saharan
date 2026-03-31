import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

import '../controller/otp_verification_controller.dart';

class SignUpVarifyOtp extends StatelessWidget {
  final String email;
  const SignUpVarifyOtp({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final otpController = Get.put(OtpVerificationController(email: email));


    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFF6F978).withOpacity(0.12),
                                spreadRadius: 6,
                                blurRadius: 8,
                              ),
                            ],
                            shape: BoxShape.circle,
                            color: const Color(0xFF053030),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFFF6F978),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        "Verify Your Account",
                        style: GoogleFonts.orbitron(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFFb1b2bd),
                            height: 1.5,
                          ),
                          children: [
                            const TextSpan(
                              text: "Enter the verification code we sent to ",
                            ),
                            TextSpan(
                              text: email,
                              style: const TextStyle(
                                color: Color(0xFFF6F978),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      PinCodeTextField(
                        // ❌ controller: otpController.otpController, → সরানো হয়েছে
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 60,
                          fieldWidth: 60,
                          activeFillColor: const Color(0xFF0A3D3E),
                          inactiveFillColor: const Color(0xFF0A3D3E),
                          selectedFillColor: const Color(0xFF0A3D3E),
                          activeColor: const Color(0xFFF6F978),
                          inactiveColor: const Color(0xFF00595B),
                          selectedColor: const Color(0xFF00595B),
                          borderWidth: 1.5,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        appContext: context,
                        onCompleted: (value) {
                          otpController.verifyOtp(otp: value);
                        },
                        onChanged: (value) {},
                      ),

                      const SizedBox(height: 32),

                    Obx(() => Center(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.sourceSans3(
                            color: const Color(0xFFB2B3BD),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: otpController.enableResend.value
                                  ? "Didn't receive code? "
                                  : "Resend in ${otpController.secondsRemaining.value}s",
                            ),
                            if (otpController.enableResend.value)
                              TextSpan(
                                text: otpController.isResendLoading.value
                                    ? "Sending..."
                                    : "Resend",
                                style: GoogleFonts.sourceSans3(
                                  color: const Color(0xFFF6F978),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => otpController.resendCode(email: email),
                              ),
                          ],
                        ),
                      ),
                    )),

                      const SizedBox(height: 40),

                      Obx(
                            () => otpController.isLoading.value
                            ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFF6F978),
                            ),
                          ),
                        )
                            : const SizedBox.shrink(),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}