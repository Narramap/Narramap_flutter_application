import 'package:flutter/material.dart';
import 'package:narramap/shared/presentation/widgets/custom_checklist.dart';

enum MultipleSelectorColors {
  gray(
    selectedColor: Color(0xFF5B5B5B),
    unselectedColor: Color(0xFFE0E0E0),
  );

  final Color selectedColor;
  final Color unselectedColor;

  const MultipleSelectorColors({
    required this.selectedColor,
    required this.unselectedColor,
  });
}

class CustomMultipleSelector<T> extends StatelessWidget {
  final String label;
  final MultipleSelectorColors colors;
  final List<Option<T>> options;
  final List<T> selectedValues;
  final Function(List<T>) onChanged;

  const CustomMultipleSelector({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
    this.colors = MultipleSelectorColors.gray,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: MultipleSelectorColors.gray.selectedColor
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: options.map((option) {
              final isSelected = selectedValues.contains(option.value);

              return GestureDetector(
                onTap: () {
                  final newSelected = List<T>.from(selectedValues);
                  if (isSelected) {
                    newSelected.remove(option.value);
                  } else {
                    newSelected.add(option.value);
                  }
                  onChanged(newSelected);
                },
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: isSelected
                      ? colors.selectedColor
                      : colors.unselectedColor,
                  child: Text(
                    option.label,
                    style: TextStyle(
                      fontSize: 10,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
