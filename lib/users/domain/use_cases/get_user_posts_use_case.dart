
import 'package:injectable/injectable.dart';
import 'package:narramap/content/data/repository/posts_repository.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/content/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class GetUserPostsUseCase {

  final IPostsRepository repository = getIt<PostsRepository>();

  Future<List<Post>?> run(String userId) async {
    return await repository.getAllByUserId(userId);
  }
}