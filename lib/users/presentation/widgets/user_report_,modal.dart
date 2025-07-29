
import 'package:flutter/material.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_text_field.dart';
import 'package:narramap/shared/utils/custom_modal.dart';

void showUserReportModal({
  required BuildContext context,
  required String Function(String) onChangeReason,
  required Future<void> Function() registerReport,
}) {
  showCustomModal(
    context, 
    Column(
      spacing: 20,
      children: [
        Text(
          "Reportar Usuario",
          style: TextStyle(
            color: TextColor.gray.textColor
          ),
        ),
        CustomTextField(
          onChanged: onChangeReason,
          label: "Motivo del reporte",
          textFieldColor: TextFieldColors.gray,
          lines: 3,
          borderRadius: 10,
        ),
        CustomButton(
          text: "Guardar", 
          onPressed: registerReport
        ),
      ],
    )
  );
}