
import 'package:injectable/injectable.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/comments/data/dto/comment_dto.dart';
import 'package:narramap/comments/data/interceptors/post_comment_interceptor.dart';
import 'package:narramap/comments/data/repository/comment_repository.dart';
import 'package:narramap/comments/domain/repository/i_comment_repository.dart';

@Injectable()
class CommentPostUseCase {

  final ICommentRepository repository = getIt<CommentRepository>();

  Future<PostCommentInterceptor?> run(CommentDto comment, String postId) async {
    return await repository.registerPostComment(comment, postId);
  }

}