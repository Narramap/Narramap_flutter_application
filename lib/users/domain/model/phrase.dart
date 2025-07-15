
class Phrase {
  final String author;
  final String text;

  Phrase({
    required this.author,
    required this.text
  });

  factory Phrase.fromJson(Map<String, dynamic> json) {
    return Phrase(
      author: json["author"], 
      text: json["phrase"]
    );
  }

  Map<String, dynamic> toJsonMap() => {
    "phrase": text,
    "author": author
  };
}