import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd_task/core/custom_colors.core.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    super.key,
    required this.controller,
    required this.isObscure,
    required this.placeholder,
  });

  final TextEditingController controller;
  final String placeholder;
  final bool isObscure;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isObscure,
      cursorColor: CustomColors.darkGray.withOpacity(0.7),
      style: GoogleFonts.inter(
        color: CustomColors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: widget.placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: CustomColors.darkGray,
          ),
        ),
      ),
    );
  }
}
