
import 'package:injectable/injectable.dart';
import 'package:narramap/content/data/repository/posts_repository.dart';
import 'package:narramap/content/domain/model/emotional_post.dart';
import 'package:narramap/content/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class GetAllEmotionalPostsUseCase {

  final IPostsRepository repository = getIt<PostsRepository>();

  Future<List<EmotionalPost>?> run() async {
    return await repository.getEmotionalPosts();
  }
}