import 'package:flutter/material.dart';

enum TextColor {

  gray(
    textColor: Color(0xFF474747)
  ),
  white(
    textColor: Color(0xFFF2F2F2)
  );

  final Color textColor;

  const TextColor({
    required this.textColor
  });
}

class CustomSwitch extends StatelessWidget {

  final bool value;
  final String label;
  final TextColor textColor;
  final Function(bool) onChanged;
  const CustomSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.textColor = TextColor.white
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: textColor.textColor),
        ),
        Switch(
          value: value, 
          onChanged: onChanged
        ),
      ],
    );
  }
}