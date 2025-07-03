
enum SexEnum {

  masculine(label: "H"),
  femenine(label: "M"),
  nonBinary(label: "NB"),
  other(label: "O");

  final String label;

  const SexEnum({
    required this.label
  });
}