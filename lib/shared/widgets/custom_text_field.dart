import 'package:flutter/material.dart';

enum TextFieldColors {

  white(
    backgroundColor: Color.fromARGB(126, 255, 255, 255),
    textColor: Colors.white
  ),
  gray(
    backgroundColor: Color(0xFFE2E2E2),
    textColor: Color(0xFF474747)
  );

  final Color backgroundColor;
  final Color textColor;

  const TextFieldColors({
    required this.backgroundColor,
    required this.textColor,
  });
}

class CustomTextField extends StatelessWidget {

  final Function(String) onChanged;
  final int lines;
  final double? spacerHeight;
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextFieldColors textFieldColor;
  final double borderRadius;

  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.label,
    this.lines = 1,
    this.obscureText = false,
    this.suffixIcon,
    this.spacerHeight,
    this.textFieldColor = TextFieldColors.white,
    this.borderRadius = 50
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: textFieldColor.textColor
          ),
        ),
        SizedBox(height: 10),
        TextField(
          maxLines: lines,
          obscureText: obscureText,
          cursorColor: Color(0xFFEBEBEB),
          onChanged: onChanged,
          style: TextStyle(
            color: textFieldColor.textColor
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            fillColor: textFieldColor.backgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none
            ),
          ),
        ),
        if (spacerHeight != null) 
          SizedBox(height: spacerHeight)
      ],
    );
  }
}