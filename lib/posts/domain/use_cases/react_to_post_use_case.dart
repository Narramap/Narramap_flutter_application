
import 'package:injectable/injectable.dart';
import 'package:narramap/posts/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/posts/data/repository/posts_repository.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/posts/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class ReactToPostUseCase {

  final IPostsRepository repository = getIt<PostsRepository>();

  Future<Post?> run(ReactionToPostDTO reactionDTO) async {

    return await repository.reactByPostId(reactionDTO);
  } 

}