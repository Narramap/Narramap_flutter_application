import 'package:flutter/material.dart';
import 'package:narramap/users/domain/model/phrase.dart';

class PhrasesContainer extends StatelessWidget {

  final List<Phrase> phrases;
  PhrasesContainer({
    super.key,
     required this.phrases
  });

  final childrenContent = [
    Text("Frases"),
    SizedBox(height: 20),
  ];

  @override
  Widget build(BuildContext context) {

    phrases.forEach((phrase) {
      childrenContent.addAll([
        Text(
          '"${phrase.text}"',
          textAlign: TextAlign.center,
        ),
        Text(
          phrase.author,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold
          ),
        )
      ]);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrenContent
    );
  }
}