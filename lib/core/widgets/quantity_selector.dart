

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:narramap/core/widgets/custom_button.dart';

class QuantitySelector extends StatelessWidget {

  final String label;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int value;
  const QuantitySelector({
    super.key,
    required this.onDecrement,
    required this.onIncrement,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              text: "", 
              onPressed: onIncrement,
              icon: Icons.add,
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 40
              ),
            ),
            CustomButton(
              text: "", 
              onPressed: onDecrement,
              icon: Icons.remove,
            ),
          ],
        )
      ],
    );
  }
}