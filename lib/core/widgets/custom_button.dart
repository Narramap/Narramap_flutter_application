
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final bool maxSize;
  final IconData? icon;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.maxSize = false,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed, 
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Comfortaa"
              ),
            ),
            if (icon != null) Icon(icon)
          ],
        ),
      )
    );
  }
}