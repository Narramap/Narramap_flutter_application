import 'package:flutter/material.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_text_field.dart';

class PasswordTextField extends StatelessWidget {

  final ValueChanged<String> onChanged;
  final VoidCallback changeShowPassword;
  final bool showPassword;
  final double? spacerHeight;
  const PasswordTextField({
    super.key,
    required this.onChanged,
    required this.changeShowPassword,
    required this.showPassword,
    this.spacerHeight
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      disableAutoComplete: true,
      onChanged: onChanged,
      label: "Contrasena",
      obscureText: !showPassword,
      suffixIcon: IconButton(
        onPressed: changeShowPassword, 
        icon: Icon(
          showPassword ? Icons.visibility_off : Icons.remove_red_eye, 
          color: Colors.white
        )
      ),
      spacerHeight: spacerHeight,
    );
  }
}