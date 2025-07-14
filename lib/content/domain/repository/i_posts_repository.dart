
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/post.dart';

abstract class IPostsRepository {

  Future<Post?> register(NewPostDTO newPost);
  Future<List<Post>?> getAll();
  Future<Post?> reactByPostId(ReactionToPostDTO reactionDTO);

}