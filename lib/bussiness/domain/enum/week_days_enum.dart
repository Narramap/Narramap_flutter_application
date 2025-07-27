
enum WeekDaysEnum {

  monday(
    label: "L",
    value: "LUNES"
  ),
  tuesday(
    label: "M",
    value: "MARTES"
  ),
  wednesday(
    label: "M",
    value: "MIÉRCOLES",
  ),
  thursday(
    label: "J",
    value: "JUEVES"
  ),
  friday(
    label: "V",
    value: "VIERNES"
  ),
  saturday(
    label: "S",
    value: "SÁBADO"
  ),
  sunday(
    label: "D",
    value: "DOMINGO"
  )
  ;

  factory WeekDaysEnum.fromString(String value) {
    return WeekDaysEnum.values.firstWhere((enumValue) => enumValue.value == value);
  }

  final String label;
  final String value;

  const WeekDaysEnum({
    required this.label,
    required this.value
  });
}