import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child:Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        "Spending History",
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
              SizedBox(height: 34,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    'By accessing or using this application,'
                        ' you agree to comply with and be bound by '
                        'these Terms & Conditions. You are responsible '
                        'for maintaining the confidentiality of your account and for all'
                        ' activities that occur under your account.The app is provided'
                        ' for informational purposes only. We reserve the right to'
                        ' update, modify, or discontinue any part of the service '
                        'at any time without prior notice. Continued use of the app'
                        ' constitutes acceptance of any updated terms.'
                    ,style: TextStyle(color: Color(0xFFEEEEF0),fontSize: 16),),
              )

            ],
          )
      ),
    );
  }
}
