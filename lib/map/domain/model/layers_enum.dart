
enum LayersEnum {

  labeledGreen(
    layerUrl:"https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
    domains: ['a', 'b', 'c'],
    label: "Verde etiquetado"
  ),
  labeledWhite(
    layerUrl: "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
    domains: ['a', 'b', 'c', 'd'],
    label: "Blanco etiquetado"
  ),
  topographic(
    layerUrl: "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png",
    domains: ['a', 'b', 'c'],
    label: "Topografico"
  ),
  satelital(
    layerUrl: "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
    domains: ['a', 'b', 'c'],
    label: "Satelital"
  );

  @override
  String toString() {
    return label;
  }


  final String layerUrl;
  final List<String> domains;
  final String label;
  final String? atribution;

  const LayersEnum({
    required this.layerUrl,
    required this.domains,
    required this.label,
    this.atribution
  });

}