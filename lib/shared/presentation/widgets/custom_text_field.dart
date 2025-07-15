import 'package:flutter/material.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

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

class CustomTextField extends StatefulWidget {

  final Function(String) onChanged;
  final int lines;
  final double? spacerHeight;
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextFieldColors textFieldColor;
  final double borderRadius;
  final String? defaultValue;

  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.label,
    this.lines = 1,
    this.obscureText = false,
    this.suffixIcon,
    this.spacerHeight,
    this.textFieldColor = TextFieldColors.white,
    this.borderRadius = 50,
    this.defaultValue
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.defaultValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: widget.textFieldColor.textColor
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: widget.lines,
          obscureText: widget.obscureText,
          cursorColor: widget.textFieldColor.textColor,
          onChanged: widget.onChanged,
          style: TextStyle(
            color: widget.textFieldColor.textColor
          ),
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            fillColor: widget.textFieldColor.backgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide.none
            ),
          ),
        ),
        if (widget.spacerHeight != null) 
          SizedBox(height: widget.spacerHeight)
      ],
    );
  }
}