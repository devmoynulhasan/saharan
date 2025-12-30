import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/authentication/widget/sign_in.dart';
import 'package:saharan/app/modules/splash/screen/sign_up.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class SinInScreen extends StatelessWidget {
  const SinInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF0A3D3E),
                  Color(0xFF032526),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            ),
          ),
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
         SizedBox(height: 60,),
            Center(
              child: Image.asset(
                AssetPaths.splash_image_one,
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              AssetPaths.splash_image_two,
              width: 200,
              height: 24,
            ),
            SizedBox(height: 38,),
            Column(
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Sign in to continue getting smart betting insights",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFB2B3BD),
                  ),
                ),
              ],
            ),
             SizedBox(height: 20,),

            SignIn(),


            SizedBox(height: 33,),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xFFF6F978),
                borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child: TextButton(
                  onPressed: (){}, 
                  child: Text("Sign In")
              ),
            ),
            SizedBox(height: 120,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 16,
                    color: Color(0xFFB2B3BD),),
                ),
                SizedBox(height:  8),
                GestureDetector(
                  onTap: () {
                   Get.to( SignUp());
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.sourceCodePro(
                      fontSize: 18,
                      color: Color(0xFFF6F978),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

        ),
      ),
    );
  }
}




