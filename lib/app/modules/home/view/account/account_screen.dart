import 'package:flutter/material.dart';
import 'package:saharan/app/modules/authentication/widget/background_color.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientBackground(
            child: Padding(padding: EdgeInsets.all(8))
        ),
    );
  }
}
