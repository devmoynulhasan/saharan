

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/resource/app_colours/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isLoading;
  final double width;
  final double paddingVertical;
  final double borderRadius;
  final Color? buttonColor;
  final double fontSize;
  final BoxBorder? border;
  final Color? titleColor;
  final Widget? widget;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.width = double.infinity,
    this.paddingVertical = 12.0,
    this.borderRadius = 100.0,
    this.buttonColor = AppColors.mainColor,
    this.border,
    this.titleColor = Colors.black,
    this.widget,
    this.fontSize = 16.0, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
      child: CircularProgressIndicator(
        color: AppColors.mainColor,
      ))
        : InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border ?? Border.all(color: borderColor ?? AppColors.mainColor),
          // gradient: LinearGradient(
          //     colors: [Color(0xff4F7E65), Color(0xff002B14)],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter
          // ),
        ),
        width: width,
        padding: EdgeInsets.symmetric(vertical: paddingVertical),
        child: widget ??
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: titleColor,
              ),
            ),
      ),
    );
  }
}
