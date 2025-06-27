import 'package:flutter/material.dart';
import 'package:narramap/core/widgets/custom_button.dart';

class DatePicker extends StatefulWidget {

  final String label;
  final DateTime? date;
  final Function(DateTime) onSelectDate;
  const DatePicker({
    super.key,
    required this.label,
    required this.date,
    required this.onSelectDate
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale("es", "MX"), // Opcional: para mostrar en español
    );

    if (picked != null && picked != widget.date) {
      // setState(() => _selectedDate = picked);
      widget.onSelectDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateText = widget.date != null
        ? '${widget.date!.day}/${widget.date!.month}/${widget.date!.year}'
        : '-- / -- / --';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Color(0xFF474747)
          ),
        ),
        SizedBox(height: 10),
        CustomButton(
          text: dateText, 
          onPressed: () =>  _selectDate(context),
          icon: Icons.calendar_month_sharp,
        )
      ],
    );
  }
}
