
import 'package:injectable/injectable.dart';
import 'package:narramap/posts/data/interceptors/post_view_interceptor.dart';
import 'package:narramap/posts/data/repository/posts_repository.dart';
import 'package:narramap/posts/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class RegisterViewUseCase {

  final IPostsRepository repository = getIt<PostsRepository>();

  Future<PostViewInterceptor?> run(String postId, String userId) async {
    return await repository.registerPostView(postId, userId);
  }
}