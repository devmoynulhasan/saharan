import 'package:flutter/material.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: GradientBackground(
       child: SingleChildScrollView(
         child: SafeArea(child:
         Text("data")
         ),
       ),
     ),
    );
  }
}


// body: SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF0A3D3E),
//                 Color(0xFF032526),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Text(
//                   "Create New Account",
//                   style: GoogleFonts.orbitron(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),