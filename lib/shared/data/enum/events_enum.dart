enum EventEnum {
  academic(label: "ACADÉMICO"),
  artistic(label: "ARTÍSTICO"),
  cultural(label: "CULTURAL"),
  musical(label: "MUSICAL"),
  political(label: "POLÍTICO"),
  promotional(label: "PROMOCIONAL"),
  social(label: "SOCIAL"),
  sports(label: "DEPORTIVO");

  final String label;

  const EventEnum({required this.label});
}