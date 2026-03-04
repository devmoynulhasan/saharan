import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_keys.dart';


enum SnackPosition { top, bottom }

enum SnackType {
  normal,
  success,
  error,
  warning,
  info,
}
void showCustomSnackBar({
  required String message,
  String? title,
  SnackType type = SnackType.normal,
  SnackPosition position = SnackPosition.bottom,   // ← new: position control
  Duration duration = const Duration(seconds: 4),
  bool showCloseButton = true,
  double borderRadius = 14,
  EdgeInsets? customMargin,                        // full override if needed
}) {
  final messenger = rootScaffoldMessengerKey.currentState;

  if (messenger == null) {
    debugPrint("ScaffoldMessenger not found! Check MaterialApp setup.");
    return;
  }

  // ──── Colors & Icons per type ────
  Color backgroundColor;
  IconData icon;
  Color iconColor = Colors.white;

  switch (type) {
    case SnackType.success:
      backgroundColor = Colors.green.shade700;
      icon = Icons.check_circle_outline_rounded;
      break;
    case SnackType.error:
      backgroundColor = Colors.red.shade700;
      icon = Icons.error_outline_rounded;
      break;
    case SnackType.warning:
      backgroundColor = Colors.orange.shade800;
      icon = Icons.warning_amber_rounded;
      break;
    case SnackType.info:
      backgroundColor = Colors.blueGrey.shade700;
      icon = Icons.info_outline_rounded;
      break;
    case SnackType.normal:
    default:
      backgroundColor = Colors.grey.shade900.withOpacity(0.94);
      icon = Icons.info_outline_rounded;
      break;
  }

  // ──── Margin / Position logic ────
  EdgeInsets margin;

  if (customMargin != null) {
    margin = customMargin;
  } else {
    switch (position) {
      case SnackPosition.top:
        margin = const EdgeInsets.fromLTRB(12, 24, 12, 0);
        break;
      case SnackPosition.bottom:
      default:
        margin = const EdgeInsets.fromLTRB(12, 0, 12, 24);
        break;
    }
  }

  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        margin: margin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...[
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 3),
                    ],
                    Text(
                      message,
                      style: GoogleFonts.poppins(
                        fontSize: title == null ? 15 : 14,
                        color: Colors.white.withOpacity(0.94),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              if (showCloseButton)
                InkWell(
                  onTap: messenger.hideCurrentSnackBar,
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.close_rounded,
                      size: 22,
                      color: Colors.white70,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
}