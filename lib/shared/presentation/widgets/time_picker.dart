import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:narramap/shared/presentation/widgets/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

class TimePicker extends StatelessWidget {
  final TextColor textColor;
  final String label;
  final DateTime? selectedTime;
  final void Function(DateTime) onTimeSelected;

  const TimePicker({
    super.key,
    this.textColor = TextColor.gray,
    required this.label,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  void _showTimePicker(BuildContext context) {
    picker.DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      currentTime: selectedTime ?? DateTime.now(),
      locale: picker.LocaleType.es,
      showSecondsColumn: false, // ⛔️ Oculta los segundos
      onConfirm: (selected) {
        final cleanTime = DateTime(
          selected.year,
          selected.month,
          selected.day,
          selected.hour,
          selected.minute,
          0, // segundos en cero ✅
        );
        onTimeSelected(cleanTime);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          label,
          style: TextStyle(
            color: textColor.textColor,
          ),
        ),

        selectedTime == null ?
          CustomButton(
            buttonColor: ButtonColors.gray,
            onPressed: () => _showTimePicker(context),
            text: 'Selecciona una hora 🕒',
          )

          :

          GestureDetector(
            onTap: () => _showTimePicker(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${selectedTime!.hour.toString().padLeft(2, '0')} : ${selectedTime!.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: textColor.textColor,
                    fontSize: 50
                  ),
                ),
                Text(
                  "🕒",
                  style: TextStyle(
                    fontSize: 25
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
