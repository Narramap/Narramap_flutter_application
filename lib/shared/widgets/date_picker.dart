import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:narramap/shared/widgets/custom_button.dart';
import 'package:narramap/shared/widgets/custom_switch.dart';

class DatePicker extends StatelessWidget {
  final TextColor textColor;
  final String label;
  final DateTime? selectedDate;
  final void Function(DateTime) onDateSelected;

  const DatePicker({
    super.key,
    this.textColor = TextColor.gray,
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: textColor.textColor
          ),
        ),
        CustomButton(
          buttonColor: ButtonColors.gray,
          onPressed: () {
            picker.DatePicker.showDatePicker(
              context,
              showTitleActions: true,
              minTime: DateTime.now(),
              maxTime: DateTime.now().add(Duration(days: 31)),
              currentTime: selectedDate ?? DateTime.now(),
              locale: picker.LocaleType.es, // Cambia a español
              onConfirm: onDateSelected,
            );
          },

          text: selectedDate != null
                ? '${selectedDate!.day} / ${selectedDate!.month} / ${selectedDate!.year}'
                : '-- / -- / --',
        ),
      ],
    );
  }
}
