
import 'package:injectable/injectable.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/shared/data/repository/comment_repository.dart';
import 'package:narramap/shared/domain/repository/i_comment_repository.dart';

@Injectable()
class DeleteCommentUseCase {

  final ICommentRepository _repository = getIt<CommentRepository>();

  Future<String?> run(String commentId) async {

    return _repository.deleteCommentById(commentId);
  }

  
}