import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saharan/app/modules/authentication/controller/sin_up_otp_verify_controller.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

class SignUpVarifyOtp extends StatelessWidget {
  // ✅ email parameter যোগ করুন
  final String email;
  const SignUpVarifyOtp({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // ✅ Controller এ email pass করুন
    final OtpVerifyController controller = Get.put(OtpVerifyController(email: email));

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
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFF6F978).withOpacity(0.1),
                                spreadRadius: 7,
                              ),
                            ],
                            shape: BoxShape.circle,
                            color: Color(0xFF053030),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFFF6F978),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
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
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFb1b2bd),
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(
                              text: "Enter the verification code we sent to your email ",
                            ),
                            TextSpan(
                              // ✅ এখন dynamic email দেখাবে
                              text: email,
                              style: TextStyle(
                                color: Color(0xFFF6F978),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),

                      PinCodeTextField(
                        controller: controller.otpController,
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
                        onChanged: controller.onOtpChanged,
                      ),

                      SizedBox(height: 24),

                      Center(
                        child: Obx(() => RichText(
                          text: TextSpan(
                            style: GoogleFonts.sourceSans3(
                              color: Color(0xFFB2B3BD),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                            ),
                            text: "Didn't get OTP? ",
                            children: [
                              TextSpan(
                                style: GoogleFonts.sourceSans3(
                                  color: controller.canResend.value
                                      ? Color(0xFFF6F978)
                                      : Color(0xFF507B7C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                text: controller.canResend.value
                                    ? "Resend"
                                    : "Resend in ${controller.resendTimer.value}s",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = controller.canResend.value
                                      ? controller.resendOtp
                                      : null,
                              )
                            ],
                          ),
                        )),
                      ),

                      Spacer(),

                      Obx(() => controller.isLoading.value
                          ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFF6F978),
                          ),
                        ),
                      )
                          : SizedBox.shrink()),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}