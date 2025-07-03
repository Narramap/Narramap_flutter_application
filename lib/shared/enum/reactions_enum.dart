
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
}