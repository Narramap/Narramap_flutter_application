
import 'package:narramap/shared/enum/reactions_enum.dart';

class Reaction {

  final ReactionsEnum type;
  final int quantity;

  Reaction({
    required this.type,
    required this.quantity
  });
}