import 'package:flutter/material.dart';
import '../../../../../resource/app_images/app_images.dart' show AssetPaths;

class FairvaseGoogleSigin extends StatelessWidget {
  const FairvaseGoogleSigin({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Scaffold নেই, সরাসরি Container
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF0A3D3E),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetPaths.google, height: 24, width: 24,
          ),
          SizedBox(width: 15),
          Text(
            "Continue with Google",
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
        ],
      ),
    );
  }
}