import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

class SignUpVarifyOtp extends StatelessWidget {
  const SignUpVarifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
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
                                )
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
                                text: "alex.647@gmail.com",
                                style: TextStyle(
                                  color: Color(0xFFF6F978),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24,),
                        PinCodeTextField(
                          // controller: _otpController,
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: Color(0xFF0A3D3E),
                              inactiveFillColor:Color(0xFF0A3D3E),
                              selectedFillColor: Color(0xFF0A3D3E),

                              activeColor: Color(0xFFF6F978),
                              inactiveColor: Color(0xFF00595B),
                              selectedColor: Color(0xFF00595B)

                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.transparent,
                          enableActiveFill: true,
                          appContext: context,
                          onChanged: (value) {},
                        ),

                        SizedBox(height: 24,),

                        Center(
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.sourceSans3(
                                color: Color(0xFFB2B3BD),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                              text: " Didn't get OTP? ",
                              children: [
                                TextSpan(
                                  style: GoogleFonts.sourceSans3(
                                    color: Color(0xFFF6F978),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  text: "Resend",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Resend OTP logic here
                                    //  Get.to( ForgotConformPassword());
                                      print("Resend OTP tapped");
                                    },
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
