
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final Function(String) onChanged;
  final int lines;
  final double? spacerHeight;
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.label,
    this.lines = 1,
    this.obscureText = false,
    this.suffixIcon,
    this.spacerHeight
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
            color: Colors.white
          ),
        ),
        SizedBox(height: 10),
        TextField(
          maxLines: lines,
          obscureText: obscureText,
          cursorColor: Color(0xFFEBEBEB),
          onChanged: onChanged,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon
          ),
        ),
        if (spacerHeight != null) 
          SizedBox(height: spacerHeight)
      ],
    );
  }
}