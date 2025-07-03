
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/map/domain/model/post.dart';
import 'package:narramap/users/domain/model/phrase.dart';
import 'package:narramap/users/domain/model/user.dart';

class UserProfile {

  final User user;
  final List<Phrase> phrases;
  final List<Post> posts;
  final List<Event> events;
  final List<User> conexions;

  UserProfile({
    required this.user,
    required this.phrases,
    required this.posts,
    required this.events,
    required this.conexions
  });
}