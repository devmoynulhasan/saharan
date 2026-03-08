import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';
import '../controller/otp_verification_controller.dart';

class ForgotVerifyAccount extends StatelessWidget {
  final String email;
  const ForgotVerifyAccount({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // ✅ type ঠিক করা হয়েছে, tag দেওয়া হয়েছে
    final OtpVerificationController controller = Get.put(
      OtpVerificationController(email: email),
      tag: 'forgot',
    );

    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFF6F978).withOpacity(0.1),
                                spreadRadius: 7,
                              )
                            ],
                            shape: BoxShape.circle,
                            color: Color(0xFF053030),
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_back_ios_new,
                                color: Color(0xFFF6F978), size: 20),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Forgot Password",
                        style: GoogleFonts.orbitron(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Verify Your Account",
                        style: GoogleFonts.orbitron(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12),
                      // ✅ contactType/Value সরিয়ে সরাসরি email দেখানো হচ্ছে
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFb1b2bd),
                              height: 1.5),
                          children: [
                            TextSpan(
                                text:
                                "Enter the verification code we sent to "),
                            TextSpan(
                              text: email,
                              style: TextStyle(
                                  color: Color(0xFFF6F978),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      PinCodeTextField(
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 60,
                          fieldWidth: 60,
                          activeFillColor: Color(0xFF0A3D3E),
                          inactiveFillColor: Color(0xFF0A3D3E),
                          selectedFillColor: Color(0xFF0A3D3E),
                          activeColor: Color(0xFFF6F978),
                          inactiveColor: Color(0xFF00595B),
                          selectedColor: Color(0xFF00595B),
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        appContext: context,
                        onChanged: (value) {},
                        // ✅ সঠিক method call
                        onCompleted: (value) {
                          controller.forgotOtpVerify(otp: value);
                        },
                      ),
                      SizedBox(height: 24),
                      // ✅ Obx দিয়ে timer দেখানো হচ্ছে
                      Obx(() => Center(
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.sourceSans3(
                              color: Color(0xFFB2B3BD),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                            ),
                            text: controller.enableResend.value
                                ? " Didn't get OTP? "
                                : " Resend in ${controller.secondsRemaining.value}s ",
                            children: [
                              if (controller.enableResend.value)
                                TextSpan(
                                  style: GoogleFonts.sourceSans3(
                                    color: Color(0xFFF6F978),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  text: controller.isResendLoading.value
                                      ? "Sending..."
                                      : "Resend",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      controller.forgotResendCode(
                                          email: email);
                                    },
                                ),
                            ],
                          ),
                        ),
                      )),
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