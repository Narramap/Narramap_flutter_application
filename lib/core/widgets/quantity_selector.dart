

import 'package:flutter/material.dart';
import 'package:narramap/core/widgets/custom_switch.dart';

class QuantitySelector extends StatelessWidget {

  final TextColor textColor;
  final String label;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int value;
  const QuantitySelector({
    super.key,
    required this.onDecrement,
    required this.onIncrement,
    required this.label,
    required this.value,
    this.textColor = TextColor.white,
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
            color: textColor.textColor,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: onIncrement,
              child: Icon(
                Icons.add, 
                color: textColor.textColor, 
                size: 30
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                color: textColor.textColor,
                fontSize: 60
              ),
            ),
            TextButton(
              onPressed: onDecrement,
              child: Icon(
                Icons.remove, 
                color: textColor.textColor, 
                size: 30
              ),
            ),
          ],
        )
      ],
    );
  }
}