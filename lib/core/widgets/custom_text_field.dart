
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final Function(String) onChanged;
  final int lines;
  final double? spacerHeight;
  final String label;

  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.label,
    this.lines = 1,
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
          cursorColor: Color(0xFFEBEBEB),
          onChanged: onChanged,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        if (spacerHeight != null) 
          SizedBox(height: spacerHeight)
      ],
    );
  }
}