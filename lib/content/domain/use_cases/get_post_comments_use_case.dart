
import 'package:injectable/injectable.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/shared/data/repository/comment_repository.dart';
import 'package:narramap/shared/domain/repository/i_comment_repository.dart';

@Injectable()
class GetPostCommentsUseCase {

  final ICommentRepository repository = getIt<CommentRepository>();

  Future<List<CommentInterceptor>?> run(String postId) async {
    return await repository.getPostComments(postId);
  }
}