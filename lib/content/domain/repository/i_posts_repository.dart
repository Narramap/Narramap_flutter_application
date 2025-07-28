
import 'package:narramap/content/data/dto/create_report_dto.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/data/interceptors/post_view_interceptor.dart';
import 'package:narramap/content/domain/model/emotional_post.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/content/domain/model/report.dart';

abstract class IPostsRepository {

  Future<Post?> register(NewPostDTO newPost);
  Future<List<Post>?> getAll();
  Future<Post?> reactByPostId(ReactionToPostDTO reactionDTO);
  Future<List<Post>?> getAllByUserId(String userId);
  Future<PostViewInterceptor?> registerPostView(String postId, String userId);
  Future<String?> deletePost(String postId);  

  Future<ReportEntity?> reportPost(String postId, CreateReportDto report);

  Future<List<EmotionalPost>?> getEmotionalPosts(); 
}
