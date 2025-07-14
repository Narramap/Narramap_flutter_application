import 'package:flutter/material.dart';
import 'package:narramap/content/data/interceptors/reaction_interceptor.dart';
import 'package:narramap/shared/data/enum/reactions_enum.dart';
import 'package:narramap/shared/presentation/widgets/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

class ReactionsContainer extends StatelessWidget {
  final List<ReactionInterceptor> reactions;

  const ReactionsContainer({
    super.key,
    required this.reactions,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap( // Wrap en lugar de Row si puede haber muchas reacciones
      alignment: WrapAlignment.start,
      spacing: 5,
      children: reactions.map((reaction) {
        return GestureDetector(
          onTap: () {
            // Puedes agregar lógica aquí si quieres
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: ButtonColors.gray.backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  reaction.quantity.toString(),
                  style: TextStyle(
                    color: TextColor.gray.textColor,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  "assets/icons/${ReactionsEnum.getReactionImage(reaction.id)}",
                  width: 16,
                  height: 16,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
