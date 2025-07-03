
import 'package:latlong2/latlong.dart';
import 'package:narramap/map/domain/model/emotion_enum.dart';
import 'package:narramap/map/domain/model/post.dart';
import 'package:narramap/map/domain/repository/posts_repository.dart';
import 'package:narramap/shared/domain/model/reaction.dart';
import 'package:narramap/shared/enum/reactions_enum.dart';

class DummyPostRepository extends PostsRepository{

  @override
  Future<List<Post>> getPosts() async {
    return [
      Post(
        id: "1",
        date: DateTime.now(),
        postImages: [
          "https://imgs.search.brave.com/tGDBCnoYYptf16Ieo7wBZmZEXj81WcOEOfKXgEe8O-A/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0..."
        ],
        reactions: ReactionsEnum.values
            .map((r) => Reaction(type: r, quantity: 10))
            .toList(),
        userImage:
            "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        userNickname: "Dieg077",
        title: "Amanecer brillante",
        content:
            "Hoy el sol salió con una energía increíble. Me siento con mucha esperanza.",
        coordinates: LatLng(16.7355, -93.1012),
        emotion: Emotions.hope,
      ),
      Post(
        id: "2",
        date: DateTime.now(),
        postImages: [],
        reactions: ReactionsEnum.values
            .map((r) => Reaction(type: r, quantity: 3))
            .toList(),
        userImage: "https://randomuser.me/api/portraits/men/2.jpg",
        userNickname: "Sergio",
        title: "Atardecer tranquilo",
        content: "Sentado en el parque viendo el cielo cambiar de color. Paz total.",
        coordinates: LatLng(16.7371, -93.0998),
        emotion: Emotions.serenity,
      ),
      Post(
        id: "3",
        date: DateTime.now(),
        postImages: [],
        reactions: ReactionsEnum.values
            .map((r) => Reaction(type: r, quantity: 5))
            .toList(),
        userImage: "https://randomuser.me/api/portraits/men/3.jpg",
        userNickname: "Luis",
        title: "¡Qué rabia!",
        content: "Hoy me trataron pésimo en el transporte público, ¡estoy furioso!",
        coordinates: LatLng(16.7360, -93.1020),
        emotion: Emotions.rage,
      ),
      Post(
        id: "4",
        date: DateTime.now(),
        postImages: [],
        reactions: ReactionsEnum.values
            .map((r) => Reaction(type: r, quantity: 7))
            .toList(),
        userImage: "https://randomuser.me/api/portraits/women/4.jpg",
        userNickname: "Ana",
        title: "Creatividad a tope",
        content:
            "No he parado de escribir ideas nuevas para el proyecto. ¡Estoy inspirado!",
        coordinates: LatLng(16.7385, -93.1001),
        emotion: Emotions.creativity,
      ),
      Post(
        id: "5",
        date: DateTime.now(),
        postImages: [],
        reactions: ReactionsEnum.values
            .map((r) => Reaction(type: r, quantity: 4))
            .toList(),
        userImage: "https://randomuser.me/api/portraits/women/5.jpg",
        userNickname: "Clara",
        title: "Recuerdo doloroso",
        content: "Hoy pasé por el lugar donde todo cambió. Dolor en el pecho.",
        coordinates: LatLng(16.7345, -93.0999),
        emotion: Emotions.pain,
      ),
      Post(
        id: "6",
        date: DateTime.now(),
        postImages: [],
        reactions: ReactionsEnum.values
            .map((r) => Reaction(type: r, quantity: 15))
            .toList(),
        userImage: "https://randomuser.me/api/portraits/men/6.jpg",
        userNickname: "JuanCarlos",
        title: "Una historia de amor",
        content: "Le propuse que vivamos juntos, y dijo que sí 💕",
        coordinates: LatLng(16.7369, -93.1010),
        emotion: Emotions.love,
      ),
      Post(
        id: "7",
        date: DateTime.now(),
        postImages: [],
        reactions: ReactionsEnum.values
            .map((r) => Reaction(type: r, quantity: 2))
            .toList(),
        userImage: "https://randomuser.me/api/portraits/men/7.jpg",
        userNickname: "Pepe",
        title: "Día sin chispa",
        content: "Nada interesante pasó hoy. Todo fue monótono.",
        coordinates: LatLng(16.7352, -93.1005),
        emotion: Emotions.boring,
      ),
      Post(
        id: "8",
        date: DateTime.now(),
        postImages: [],
        reactions: ReactionsEnum.values
            .map((r) => Reaction(type: r, quantity: 12))
            .toList(),
        userImage: "https://randomuser.me/api/portraits/women/8.jpg",
        userNickname: "Sofia",
        title: "Estoy feliz",
        content:
            "Conseguí una beca para estudiar en el extranjero. ¡Estoy lleno de alegría!",
        coordinates: LatLng(16.7377, -93.1015),
        emotion: Emotions.happiness,
      ),
    ];
  }
}