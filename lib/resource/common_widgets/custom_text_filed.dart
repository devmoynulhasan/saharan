import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String? label;                    // Optional label above field
  final String hint;                      // Required hint text
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;                 // true → password mode
  final bool initiallyObscure;            // only matters when obscureText = true
  final Widget? prefixIcon;
  final Widget? suffixIcon;               // overrides default eye icon if provided
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final bool readOnly;
  final int? maxLines;
  final double borderRadius;
  final double focusedBorderWidth;
  final Color? fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color textColor;
  final Color hintColor;
  final Color labelColor;
  final double? height;                   // optional fixed height
  final EdgeInsets? contentPadding;
  final bool filled;

  const CustomTextField({
    super.key,
    this.label,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.initiallyObscure = true,         // default: hidden when password
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.readOnly = false,
    this.maxLines = 1,
    this.borderRadius = 12,
    this.focusedBorderWidth = 2.0,
    this.fillColor,
    this.borderColor = Colors.white30,
    this.focusedBorderColor = const Color(0xFFF6F978),
    this.textColor = Colors.white,
    this.hintColor = Colors.white54,
    this.labelColor = Colors.white,
    this.height,
    this.contentPadding,
    this.filled = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText && widget.initiallyObscure;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final effectiveFillColor = widget.fillColor ?? Colors.white.withOpacity(0.08);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label (optional)
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: widget.labelColor,
            ),
          ),
          const SizedBox(height:5),
        ],

        // Main field
        SizedBox(
          height: widget.height, // optional fixed height
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            obscureText: _obscureText,
            obscuringCharacter: '●',
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            validator: widget.validator,
            style: GoogleFonts.poppins(
              color: widget.textColor,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.poppins(
                color: widget.hintColor,
                fontSize: 15,
              ),
              filled: widget.filled,
              fillColor: effectiveFillColor,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),

              // Borders
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.borderColor,
                  width: 1.2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.borderColor,
                  width: 1.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.focusedBorderColor,
                  width: widget.focusedBorderWidth,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: Colors.redAccent, width: 1.8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: Colors.redAccent, width: 1.8),
              ),

              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon ??
                  (widget.obscureText
                      ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white70,
                      size: 22,
                    ),
                    onPressed: _toggleVisibility,
                  )
                      : null),
            ),
          ),
        ),
      ],
    );
  }
}