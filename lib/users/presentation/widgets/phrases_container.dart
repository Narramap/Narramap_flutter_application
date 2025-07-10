import 'package:flutter/material.dart';
import 'package:narramap/shared/widgets/custom_switch.dart';
import 'package:narramap/users/domain/model/phrase.dart';

class PhrasesContainer extends StatelessWidget {

  final List<Phrase> phrases;
  PhrasesContainer({
    super.key,
     required this.phrases
  });

  

  @override
  Widget build(BuildContext context) {

    final childrenContent = [
      Text(
        "Frases",
        style: TextStyle(
          color: TextColor.gray.textColor,
          fontSize: 20
        ),
      ),
      if(phrases.isNotEmpty)
        SizedBox(height: 20),
    ];

    phrases.forEach((phrase) {
      childrenContent.addAll([
        Text(
          '"${phrase.text}"',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TextColor.gray.textColor
          ),
        ),
        Text(
          phrase.author,
          
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: TextColor.gray.textColor
          ),
        ),
        SizedBox(height: 20,)
      ]);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: childrenContent
    );
  }
}