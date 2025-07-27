
import 'package:flutter/material.dart';

enum ButtonColors {
  white(
    backgroundColor: Colors.white, 
    textColor: Colors.black
  ),
  gray(
    backgroundColor: Color(0xFFE0E0E0), 
    textColor: Color(0xFF5B5B5B)
  ),
  transparent(
    backgroundColor: Color.fromARGB(125, 255, 2555, 255), 
    textColor: Color(0xFF5B5B5B)
  );

  final Color backgroundColor;
  final Color textColor;

  const ButtonColors({
    required this.backgroundColor,
    required this.textColor
  });
}

class CustomButton extends StatelessWidget {

  final String text;
  final ButtonColors buttonColor;
  final VoidCallback onPressed;
  final bool maxSize;
  final IconData? icon;
  final double padding;
  final double spacingWithIcon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.maxSize = false,
    this.padding = 15,
    this.buttonColor = ButtonColors.white,
    this.icon,
    this.spacingWithIcon = 10
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(buttonColor.backgroundColor)
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: buttonColor.textColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Comfortaa"
              ),
            ),
            SizedBox(width: spacingWithIcon),
            if (icon != null) Icon(
              icon,
              color: buttonColor.textColor,
            )
          ],
        ),
      )
    );
  }
}