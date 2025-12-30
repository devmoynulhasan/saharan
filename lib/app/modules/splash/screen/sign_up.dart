import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFFF6F978),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
