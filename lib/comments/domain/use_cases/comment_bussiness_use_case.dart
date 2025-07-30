
import 'package:injectable/injectable.dart';
import 'package:narramap/comments/data/dto/comment_dto.dart';
import 'package:narramap/comments/data/interceptors/bussiness_comment_interceptor.dart';
import 'package:narramap/comments/data/repository/comment_repository.dart';
import 'package:narramap/comments/domain/repository/i_comment_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class CommentBussinessUseCase {

  final ICommentRepository repository = getIt<CommentRepository>();

  Future<BussinessCommentInterceptor?> run(CommentDto comment, String bussinessId) async {
    return await repository.registerBussinessComment(comment, bussinessId);
  }

}