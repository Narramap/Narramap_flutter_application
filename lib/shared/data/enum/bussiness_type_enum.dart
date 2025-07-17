
enum BussinessTypeEnum {

  resturant(label: "resturant"),
  clothes(label: "ropa"),
  accesories(label: "accesorios"),
  groceriesStore(label: "abarrotes"),
  services(label: "servicios"),
  niche(label: "nicho")
  ;

  final String label;

  const BussinessTypeEnum({
    required this.label
  });
}