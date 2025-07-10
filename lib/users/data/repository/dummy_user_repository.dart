
import 'package:latlong2/latlong.dart';
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/map/domain/model/emotion_enum.dart';
import 'package:narramap/map/domain/model/post.dart';
import 'package:narramap/shared/domain/model/reaction.dart';
import 'package:narramap/shared/enum/reactions_enum.dart';
import 'package:narramap/shared/enum/sex_enum.dart';
import 'package:narramap/users/domain/model/phrase.dart';
import 'package:narramap/users/domain/model/user.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:narramap/users/domain/repository/i_user_repository.dart';

class DummyUserRepository extends IUserRepository {

  @override
  Future<UserProfile> getUserProfile(String token) async {

    return UserProfile(
      user: User(
        age: 20,
        id: "u1",
        imageUrl: "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
        nickname: "Dieg077",
        biography: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        public: true,
        sex: SexEnum.masculine
      ),
      events: [
        Event(
          id: 'e1',
          userImage: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
          location: LatLng(16.7355, -93.1012),
          radius: 200,
          title: 'Taller de Fotografía Urbana',
          description: 'Explora la ciudad y aprende técnicas de fotografía con expertos locales.',
          imageUrls: [
            'https://images.unsplash.com/photo-1504198458649-3128b932f49b',
            'https://images.unsplash.com/photo-1535930749574-1399327ce78f',
          ],
          date: DateTime(2025, 7, 5),
          initTime: 10.0,
          endTime: 12.5,
        ),
        Event(
          id: 'e2',
          userImage: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
          location: LatLng(16.7371, -93.0998),
          radius: 150,
          title: 'Encuentro de Lectores al Aire Libre',
          description: 'Intercambia libros y comparte lecturas favoritas en el parque central.',
          imageUrls: [
            'https://images.unsplash.com/photo-1519681393784-d120267933ba',
          ],
          date: DateTime(2025, 7, 10),
          initTime: 16.0,
          endTime: 18.0,
        ),
        Event(
          id: 'e3',
          userImage: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
          location: LatLng(16.7369, -93.1015),
          radius: 100,
          title: 'Mural Colectivo de Expresión Emocional',
          description: 'Pinta tus emociones en un mural comunitario con artistas locales.',
          imageUrls: [
            'https://images.unsplash.com/photo-1563201517-eac591a1b2bb',
            'https://images.unsplash.com/photo-1617196033495-d84838cf92d9',
          ],
          date: DateTime(2025, 7, 15),
          initTime: 14.0,
          endTime: 17.0,
        ),
      ],
      phrases: [
        Phrase(
          author: "Frida Kahlo",
          text: "Pies, ¿para qué los quiero si tengo alas para volar?",
        ),
        Phrase(
          author: "Albert Einstein",
          text: "La imaginación es más importante que el conocimiento.",
        ),
        Phrase(
          author: "Octavio Paz",
          text: "La libertad no necesita alas, lo que necesita es echar raíces.",
        ),
        Phrase(
          author: "Simone de Beauvoir",
          text: "El problema de la mujer siempre ha sido un problema de hombres.",
        ),
        Phrase(
          author: "Jorge Luis Borges",
          text: "Siempre imaginé que el Paraíso sería algún tipo de biblioteca.",
        ),
        Phrase(
          author: "Virginia Woolf",
          text: "No hay barrera, cerradura ni cerrojo que puedas imponer a la libertad de mi mente.",
        ),
        Phrase(
          author: "Gabriel García Márquez",
          text: "La memoria del corazón elimina los malos recuerdos y magnifica los buenos.",
        ),
        Phrase(
          author: "Emil Cioran",
          text: "El verdadero miedo es el miedo sin objeto.",
        ),
        Phrase(
          author: "Carl Jung",
          text: "Lo que niegas te somete, lo que aceptas te transforma.",
        ),
        Phrase(
          author: "Clarice Lispector",
          text: "No soy tan triste así, es que me gusta fingir que lo soy.",
        ),
      ],
      posts: [
        Post(
          id: "p1", 
          postImages: ["https://imgs.search.brave.com/TOJVfp6QwMPWch3l4wYDAKbFoMF5T6tvVK8BcWQ-8b0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vTUFEQ1hz/TnJZb3MvMS90aHVt/Ym5haWxfbGFyZ2Ut/MS9jYW52YS1wYWlz/YWplcy1kZS1jYWZh/eWF0ZS1NQURDWHNO/cllvcy5qcGc"], 
          userImage: "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg", 
          userNickname: "Dieg077", 
          date: DateTime.now(), 
          title: "hermoso paisaje", 
          content: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", 
          coordinates: LatLng(16, -93), 
          emotion: Emotions.creativity, 
          reactions: ReactionsEnum.values.map((reaction) => Reaction(type: reaction, quantity: 10)).toList()
        ),
        Post(
          id: "p1",
          postImages: [
            "https://imgs.search.brave.com/TOJVfp6QwMPWch3l4wYDAKbFoMF5T6tvVK8BcWQ-8b0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vTUFEQ1hz/TnJZb3MvMS90aHVt/Ym5haWxfbGFyZ2Ut/MS9jYW52YS1wYWlz/YWplcy1kZS1jYWZh/eWF0ZS1NQURDWHNO/cllvcy5qcGc"
          ],
          userImage:
              "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
          userNickname: "Dieg077",
          date: DateTime.now(),
          title: "Hermoso paisaje",
          content:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          coordinates: LatLng(16.735, -93.101),
          emotion: Emotions.creativity,
          reactions: ReactionsEnum.values
              .map((reaction) => Reaction(type: reaction, quantity: 10))
              .toList(),
        ),
        Post(
          id: "p2",
          postImages: [
            "https://images.unsplash.com/photo-1506744038136-46273834b3fb"
          ],
          userImage:
              "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
          userNickname: "Luz_23",
          date: DateTime.now().subtract(Duration(days: 1)),
          title: "Caminata inspiradora",
          content: "Pasear entre árboles me llena de nuevas ideas 🌿✨",
          coordinates: LatLng(16.738, -93.098),
          emotion: Emotions.hope,
          reactions: ReactionsEnum.values
              .map((reaction) => Reaction(type: reaction, quantity: 5))
              .toList(),
        ),
        Post(
          id: "p3",
          postImages: [
            "https://images.unsplash.com/photo-1526045612212-70caf35c14df"
          ],
          userImage:
              "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
          userNickname: "JuanC_95",
          date: DateTime.now().subtract(Duration(days: 3)),
          title: "¡Qué día tan frustrante!",
          content:
              "Todo me salió mal hoy... Desde que desperté sabía que algo andaba raro.",
          coordinates: LatLng(16.736, -93.104),
          emotion: Emotions.rage,
          reactions: ReactionsEnum.values
              .map((reaction) => Reaction(type: reaction, quantity: 2))
              .toList(),
        ),
        Post(
          id: "p4",
          postImages: [
            "https://images.unsplash.com/photo-1487412912498-0447578fcca8"
          ],
          userImage:
              "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
          userNickname: "Marta_R",
          date: DateTime.now().subtract(Duration(hours: 6)),
          title: "Compartiendo alegría",
          content: "Hoy me encontré con una amiga que no veía hace años. Qué emoción 😄",
          coordinates: LatLng(16.734, -93.099),
          emotion: Emotions.happiness,
          reactions: ReactionsEnum.values
              .map((reaction) => Reaction(type: reaction, quantity: 12))
              .toList(),
        ),
      ],
      conexions: [
        User(
          id: "u2", 
          nickname: "r0drig07198", 
          age: 22,
          biography: "", 
          sex: SexEnum.masculine, 
          imageUrl: "https://thumbs.dreamstime.com/b/sonrisa-hermosa-del-hombre-18060083.jpg", 
          public: false
        ),
        User(
          id: "u1",
          nickname: "dieg077",
          age: 28,
          biography: "Amo explorar lugares nuevos y capturar emociones urbanas.",
          sex: SexEnum.masculine,
          imageUrl: "https://randomuser.me/api/portraits/men/11.jpg",
          public: true,
        ),
        User(
          id: "u2",
          nickname: "r0drig07198",
          age: 22,
          biography: "",
          sex: SexEnum.masculine,
          imageUrl: "https://thumbs.dreamstime.com/b/sonrisa-hermosa-del-hombre-18060083.jpg",
          public: false,
        ),
        User(
          id: "u3",
          nickname: "lina.art",
          age: 25,
          biography: "Diseñadora gráfica con pasión por los atardeceres y la música indie.",
          sex: SexEnum.femenine,
          imageUrl: "https://randomuser.me/api/portraits/women/32.jpg",
          public: true,
        ),
        User(
          id: "u4",
          nickname: "zenwalker",
          age: 30,
          biography: "Buscando siempre el equilibrio en la ciudad y en la vida.",
          sex: SexEnum.masculine,
          imageUrl: "https://randomuser.me/api/portraits/men/52.jpg",
          public: true,
        ),
        User(
          id: "u5",
          nickname: "samantha_q",
          age: 27,
          biography: "Compartiendo pensamientos desde cada rincón del mundo.",
          sex: SexEnum.femenine,
          imageUrl: "https://randomuser.me/api/portraits/women/68.jpg",
          public: false,
        ),
        User(
          id: "u6",
          nickname: "migue_xd",
          age: 21,
          biography: "A veces fotógrafo, siempre curioso.",
          sex: SexEnum.masculine,
          imageUrl: "https://randomuser.me/api/portraits/men/24.jpg",
          public: true,
        ),
        User(
          id: "u7",
          nickname: "moonrise42",
          age: 23,
          biography: "Lunática, soñadora, un poco poeta.",
          sex: SexEnum.femenine,
          imageUrl: "https://randomuser.me/api/portraits/women/45.jpg",
          public: true,
        ),
      ]
    );
  }

  @override
  Future<List<Phrase>> addPhrase(String token, Phrase phrase) {
    // TODO: implement addPhrase
    throw UnimplementedError();
  }

  @override
  Future<User> updateProfilePrivacy(String token) {
    // TODO: implement updateProfilePrivacy
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> getUserEvents(String token) {
    // TODO: implement getUserEvents
    throw UnimplementedError();
  }

  @override
  Future<List<Phrase>> getUserPhrases(String token) {
    // TODO: implement getUserPhrases
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getUserPosts(String token) {
    // TODO: implement getUserPosts
    throw UnimplementedError();
  }

}