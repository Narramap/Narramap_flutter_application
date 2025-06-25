

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, textAlign: TextAlign.left,),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: onIncrement,
              child: Icon(
                Icons.add, 
                color: Colors.white, 
                size: 30
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 60
              ),
            ),
            TextButton(
              onPressed: onDecrement,
              child: Icon(
                Icons.remove, 
                color: Colors.white, 
                size: 30
              ),
            ),
          ],
        )
      ],
    );
  }
}