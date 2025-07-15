/*import 'package:flutter/material.dart';

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

class CampoSeleccionEjemplo extends StatefulWidget {
  @override
  _CustomSelectField createState() => _CustomSelectField();
}

class _CustomSelectField extends State<CampoSeleccionEjemplo> {
  String? _selectedOption;
  final List<String> _options = [
    'ACADÉMICO', 'ARTÍSTICO', 'CULTURAL', 'DEPORTIVO',
    'MUSICAL', 'POLÍTICO', 'PROMOCIONAL', 'SOCIAL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tipo de evento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DropdownButtonFormField<String>(
          value: _selectedOption,
          decoration: InputDecoration(
            labelText: 'Selecciona una opción',
            border: OutlineInputBorder(),
          ),
          items: _options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (String? newOption) {
            setState(() {
              _selectedOption = newOption;
            });
          },
        ),
      ),
    );
  }
}*/
