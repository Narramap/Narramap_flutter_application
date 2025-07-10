

import 'package:narramap/shared/enum/reactions_enum.dart';

class Reaction {
  
  final int id;
  final String value;
  final ReactionsEnum reactionType;

  Reaction({
    required this.id,
    required this.value,
    required this.reactionType
  });

}