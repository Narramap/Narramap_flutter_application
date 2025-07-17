import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.options,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? (widget.options.isNotEmpty ? widget.options.first : null);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
    );
  }
}
