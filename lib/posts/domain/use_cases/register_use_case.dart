
import 'package:injectable/injectable.dart';
import 'package:narramap/posts/data/dto/new_post_dto.dart';
import 'package:narramap/posts/data/repository/posts_repository.dart';
import 'package:narramap/posts/domain/model/post.dart';
import 'package:narramap/posts/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class RegisterUseCase {

  IPostsRepository repository = getIt<PostsRepository>();

  Future<Post?> run(NewPostDTO newPost) async {

    return await repository.register(newPost);
  }
}