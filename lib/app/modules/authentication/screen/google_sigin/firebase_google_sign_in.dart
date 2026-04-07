import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../resource/app_images/app_images.dart' show AssetPaths;
import '../../../../data/network/ent_point.dart';
import 'googlesigninservice.dart'; // GoogleSignInService import

class FairvaseGoogleSigin extends StatelessWidget {
  const FairvaseGoogleSigin({super.key});

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      final user = await GoogleSignInService.signInWithGoogle();

      if (user == null) {
        print("❌ Google Sign-In বাতিল হয়েছে বা ব্যর্থ হয়েছে");
        return;
      }

      print("👤 Email: ${user.email}");
      print("👤 Name: ${user.displayName}");
      print("👤 Photo: ${user.photoURL}");

      // ✅ Backend API Call
      final response = await http.post(
        Uri.parse(EndPoint.googleSignIn),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": user.email,
          "imageUrl": user.photoURL,
          "firstName": user.displayName,
        }),
      );

      print("📡 Status: ${response.statusCode}");
      print("📡 Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Login Successful!");
        // Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        print("❌ API Error: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleGoogleSignIn(context),
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF0A3D3E),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.google, height: 24, width: 24),
            const SizedBox(width: 15),
            const Text(
              "Continue with Google",
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
          ],
        ),
      ),
    );
  }
}