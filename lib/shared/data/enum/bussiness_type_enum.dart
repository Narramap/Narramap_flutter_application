
enum BussinessTypeEnum {

  resturant(
    label: "resturant",
    apiValue: "RESTAURANT"
  ),
  clothes(
    label: "ropa",
    apiValue: "ROPA"
  ),
  accesories(
    label: "accesorios",
    apiValue: "ACCESORIOS"
  ),
  groceriesStore(
    label: "abarrotes",
    apiValue: "ABARROTES"
  ),
  services(
    label: "servicios",
    apiValue: "SERVICIOS"
  ),
  niche(
    label: "nicho",
    apiValue: "NICHO"
  )
  ;

  final String label;
  final String apiValue;

  @override
  String toString() => label;

  const BussinessTypeEnum({
    required this.apiValue,
    required this.label
  });

  factory BussinessTypeEnum.fromString(String value) {
    return BussinessTypeEnum.values.firstWhere((enumValue) => enumValue.apiValue == value);
  }
}