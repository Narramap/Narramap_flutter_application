import 'package:flutter/material.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_checklist.dart';

class CustomRadioButton<T> extends StatelessWidget {
  
  final String label;
  final T group;
  final List<Option<T>> options;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;
  const CustomRadioButton({
    super.key,
    required this.group,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onChanged
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
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              ...options.map((option) {
                final isSelected = option.value == selectedValue;
          
                return GestureDetector(
                  onTap: () => onChanged(option.value),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: isSelected ? Colors.white : Color.fromARGB(126, 255, 255, 255),
                    child: Text(
                      option.label,
                      style: TextStyle(
                        color: isSelected ? Color(0xFF898989) : Colors.white
                      ),
                    )
                  ),
                );
              }) 
            ],
          ),
        ],
      )
    );
  }
}