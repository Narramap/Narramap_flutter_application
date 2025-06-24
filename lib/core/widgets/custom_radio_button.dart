import 'package:flutter/material.dart';
import 'package:narramap/core/widgets/custom_checklist.dart';

class CustomRadioButton<T> extends StatelessWidget {

  final T group;
  final List<Option> options;
  final ValueChanged<T?> onChanged;
  const CustomRadioButton({
    super.key,
    required this.group,
    required this.options,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        ...options.map((option) => SizedBox(
          width: 100,
          child: RadioListTile<T>(
            title: Text(option.label),
            value: option.value,
            groupValue: group,
            onChanged: onChanged,
          ),
        )) 
      ],
    );
  }
}