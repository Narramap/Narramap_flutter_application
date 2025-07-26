
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/map/domain/model/post.dart';
import 'package:narramap/users/data/dto/update_profile_dto.dart';
import 'package:narramap/users/data/dto/user_report_dto.dart';
import 'package:narramap/users/data/interceptors/user_report_interceptor.dart';
import 'package:narramap/users/domain/model/phrase.dart';
import 'package:narramap/users/domain/model/user.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

abstract class IUserRepository {
  Future<UserProfile?> getUserProfile(String userId, String token);
  Future<List<Phrase>?> getPhrases(String token, String userId);
  // Future<User> updateProfilePrivacy(String token);
  Future<Phrase?> addPhrase(String token, Phrase phrase);
  Future<UserProfile?> updateUserProfile(String token, UpdateProfileDTO updateDTO);

  Future<UserReportInterceptor?> reportUserById(UserReportDto userReportDTO);
  // Future<List<Post>> getUserPosts(String token);
  // Future<List<Event>> getUserEvents(String token);
  // Future<List<Phrase>> getUserPhrases(String token);
}