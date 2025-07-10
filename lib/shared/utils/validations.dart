
bool validateEmail(String email) {

  final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  return emailRegex.hasMatch(email);
}

bool validateContainsLetters(String texto) {
  final regex = RegExp(r'^[a-zA-ZÁÉÍÓÚáéíóúÑñ\s]+$');
  return regex.hasMatch(texto);
}

bool validateContainsLettersNumbers(String texto) {
  final regex = RegExp(r'^[a-zA-Z0-9]+$');
  return regex.hasMatch(texto);
}

bool validateContainsSafetyCharacters(String texto) {
  final regex = RegExp(r'^[a-zA-Z0-9\s.,;:!?()@_\-]+$');
  return regex.hasMatch(texto);
}
