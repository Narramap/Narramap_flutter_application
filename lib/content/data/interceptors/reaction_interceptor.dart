
class ReactionInterceptor {

  final int id;
  final String value;
  final int quantity;

  ReactionInterceptor({
    required this.id,
    required this.value,
    required this.quantity
  });

  factory ReactionInterceptor.fromJson(Map<String, dynamic> json) {
    return ReactionInterceptor(
      id: json["id"], 
      value: json["value"], 
      quantity: json["quantity"]
    );
  }
}