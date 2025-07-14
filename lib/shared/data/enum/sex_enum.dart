
enum SexEnum {

  masculine(
    label: "H", 
    valueForAPI: "HOMBRE"
  ),
  femenine(
    label: "M",
    valueForAPI: "MUJER"
  ),
  nonBinary(
    label: "NB",
    valueForAPI: "NOBINARIO"
  ),
  other(
    label: "O",
    valueForAPI: "OTRO"
  );

  final String label;
  final String valueForAPI;

  const SexEnum({
    required this.label,
    required this.valueForAPI
  });
}