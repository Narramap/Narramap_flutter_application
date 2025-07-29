import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> options;
  final T? initialValue;
  final ValueChanged<T> onChanged;

  const CustomDropdown({
    super.key,
    required this.options,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? (widget.options.isNotEmpty ? widget.options.first : null);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: selectedValue,
      items: widget.options.map<DropdownMenuItem<T>>((value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: (newValue) {

        setState(() {
          selectedValue = newValue;
        });
        if(newValue != null) {
          widget.onChanged(newValue);
        }
      },
    );
  }
}
