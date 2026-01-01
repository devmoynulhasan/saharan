import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({
    super.key,
    required this.child,
  });

  // Gradient decoration টা static method হিসেবে
  static BoxDecoration get gradientDecoration {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF0A3D3E),
          Color(0xFF032526),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gradientDecoration,
      child: child,
    );
  }
}