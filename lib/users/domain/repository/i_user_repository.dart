
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/map/domain/model/post.dart';
import 'package:narramap/users/domain/model/phrase.dart';
import 'package:narramap/users/domain/model/user.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

abstract class IUserRepository {
  Future<UserProfile> getUserProfile(String token);
  Future<User> updateProfilePrivacy(String token);
  Future<List<Phrase>> addPhrase(String token, Phrase phrase);
  Future<List<Post>> getUserPosts(String token);
  Future<List<Event>> getUserEvents(String token);
  Future<List<Phrase>> getUserPhrases(String token);
}