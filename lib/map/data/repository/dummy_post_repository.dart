
import 'package:latlong2/latlong.dart';
import 'package:narramap/map/domain/model/emotion_enum.dart';
import 'package:narramap/map/domain/model/post.dart';
import 'package:narramap/map/domain/repository/posts_repository.dart';

class DummyPostRepository extends PostsRepository{

  @override
  Future<List<Post>> getPosts() async {
    return [
      Post(
        id: "1",
        userId: "u1",
        title: "Amanecer brillante",
        content: "Hoy el sol salió con una energía increíble. Me siento con mucha esperanza.",
        coordinates: LatLng(16.7355, -93.1012),
        emotion: Emotions.hope,
      ),
      Post(
        id: "2",
        userId: "u2",
        title: "Atardecer tranquilo",
        content: "Sentado en el parque viendo el cielo cambiar de color. Paz total.",
        coordinates: LatLng(16.7371, -93.0998),
        emotion: Emotions.serenity,
      ),
      Post(
        id: "3",
        userId: "u3",
        title: "¡Qué rabia!",
        content: "Hoy me trataron pésimo en el transporte público, ¡estoy furioso!",
        coordinates: LatLng(16.7360, -93.1020),
        emotion: Emotions.rage,
      ),
      Post(
        id: "4",
        userId: "u4",
        title: "Creatividad a tope",
        content: "No he parado de escribir ideas nuevas para el proyecto. ¡Estoy inspirado!",
        coordinates: LatLng(16.7385, -93.1001),
        emotion: Emotions.creativity,
      ),
      Post(
        id: "5",
        userId: "u5",
        title: "Recuerdo doloroso",
        content: "Hoy pasé por el lugar donde todo cambió. Dolor en el pecho.",
        coordinates: LatLng(16.7345, -93.0999),
        emotion: Emotions.pain,
      ),
      Post(
        id: "6",
        userId: "u6",
        title: "Una historia de amor",
        content: "Le propuse que vivamos juntos, y dijo que sí 💕",
        coordinates: LatLng(16.7369, -93.1010),
        emotion: Emotions.love,
      ),
      Post(
        id: "7",
        userId: "u7",
        title: "Día sin chispa",
        content: "Nada interesante pasó hoy. Todo fue monótono.",
        coordinates: LatLng(16.7352, -93.1005),
        emotion: Emotions.boring,
      ),
      Post(
        id: "8",
        userId: "u8",
        title: "Estoy feliz",
        content: "Conseguí una beca para estudiar en el extranjero. ¡Estoy lleno de alegría!",
        coordinates: LatLng(16.7377, -93.1015),
        emotion: Emotions.happiness,
      ),
    ];
  }
}