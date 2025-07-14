
import 'package:narramap/shared/data/enum/reactions_enum.dart';

class Reaction {

  final ReactionsEnum type;
  final int quantity;

  Reaction({
    required this.type,
    required this.quantity
  });
}