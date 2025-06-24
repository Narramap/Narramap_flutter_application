import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {

  final bool value;
  final String label;
  final Function(bool) onChanged;
  const CustomSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: value, 
          onChanged: onChanged
        ),
      ],
    );
  }
}