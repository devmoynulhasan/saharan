import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
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
              child: Text("Your privacy is important to us."
                  " We collect only the information necessary to provide and improve our services,"
                  " such as account details and usage data. "
                  "All personal information is handled securely and is "
                  "never sold or shared with third parties without your consent, "
                  "except where required by law.We use industry-standard security "
                  "measures to protect your data and ensure a safe experience. "
                  "By using our app, you agree to the collection and use of information"
                  " in accordance with this policy.",
                style: TextStyle(
                  color: Color(0xFFEEEEF0),
                  fontSize: 16,
                ),

              ),
            )
        
          ],
        ),
      ),
    );
  }
}
