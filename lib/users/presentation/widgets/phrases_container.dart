import 'package:flutter/material.dart';
import 'package:narramap/shared/presentation/widgets/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/custom_text_field.dart';
import 'package:narramap/users/domain/model/phrase.dart';

class PhrasesContainer extends StatelessWidget {

  final List<Phrase> phrases;
  final bool addingPhrases;
  final void Function() toggleAddingPhrase;
  final String Function(String) onChangeTextPhrase;
  final String Function(String) onChangeAuthor;
  final void Function() savePhrase;

  const PhrasesContainer({
    super.key,
    required this.addingPhrases,
    required this.phrases,
    required this.toggleAddingPhrase,
    required this.onChangeAuthor,
    required this.onChangeTextPhrase,
    required this.savePhrase
  });


  @override
  Widget build(BuildContext context) {

    final List<Widget> childrenContent = [];

    phrases.forEach((phrase) {
      childrenContent.addAll([
        Text(
          '"${phrase.text}"',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TextColor.gray.textColor
          ),
        ),
        SizedBox(height: 10),
        Text(
          phrase.author,
          textAlign: TextAlign.center,
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
      children: [
        Text(
          "Frases",
          style: TextStyle(
            color: TextColor.gray.textColor,
            fontSize: 20
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            children: childrenContent,
          ),
        ),
        !addingPhrases ?
          CustomButton(
            buttonColor: ButtonColors.gray,
            text: "Nueva Frase",
            onPressed: toggleAddingPhrase,
          )
        :
          Column(
            spacing: 20,
            children: [
              CustomTextField(
                onChanged: onChangeTextPhrase,
                label: "Frase",
                textFieldColor: TextFieldColors.gray,
              ),
              CustomTextField(
                onChanged: onChangeAuthor,
                label: "Autor",
                textFieldColor: TextFieldColors.gray,
              ),
              CustomButton(
                buttonColor: ButtonColors.gray,
                text: "Cancelar",
                onPressed: toggleAddingPhrase,
              ),
              CustomButton(
                text: "Guardar",
                onPressed: savePhrase,
              )
            ],
          ),
      ]
    );
  }
}