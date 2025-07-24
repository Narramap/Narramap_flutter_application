
import 'package:injectable/injectable.dart';
import 'package:narramap/content/data/repository/posts_repository.dart';
import 'package:narramap/content/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class DeletePostUseCase {

  final IPostsRepository repository = getIt<PostsRepository>();

  Future<String?> run(String postId) async {
    return await repository.deletePost(postId);
  }
}