
enum ReactionsEnum {

  like(imageName: "like.png"),
  tranquility(imageName: "peace.png"),
  sadness(imageName: "sadness.png"),
  madness(imageName: "madness.png"),
  inspiration(imageName: "inspiration.png")
  ;

  final String imageName;

  const ReactionsEnum({
    required this.imageName
  });

  static String getReactionImage(int reactionId) {

    switch (reactionId) {

      case 2: return like.imageName;
      case 3: return tranquility.imageName;
      case 4: return ReactionsEnum.madness.imageName;
      case 5: return ReactionsEnum.sadness.imageName;
      case 6: return inspiration.imageName;
    }

    return "no image";

  }
}