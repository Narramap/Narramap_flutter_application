
import 'package:injectable/injectable.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/content/data/repository/posts_repository.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/content/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class RegisterUseCase {

  IPostsRepository repository = getIt<PostsRepository>();

  Future<Post?> run(NewPostDTO newPost) async {

    return await repository.register(newPost);
  }
}