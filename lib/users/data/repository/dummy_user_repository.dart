
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
      events: [],
      phrases: [],
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
        )
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
        )
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