import 'package:flutter/material.dart';

class Option<T> {
  final String label;
  final T value;

  Option({
    required this.label,
    required this.value
  });
}

class CustomChecklist<T> extends StatelessWidget {

  final List<Option<T>> options;
  final ValueChanged<bool?> onChanged;
  const CustomChecklist({
    super.key,
    required this.options,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...options.map((option) => CheckboxListTile(
          title: Text(option.label),
          value: true, 
          onChanged: onChanged,
        )),
      ],
    );
  }
}