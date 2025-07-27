
import 'package:injectable/injectable.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/shared/data/inteceptors/comment_interceptor.dart';
import 'package:narramap/shared/data/repository/comment_repository.dart';
import 'package:narramap/shared/domain/repository/i_comment_repository.dart';

@Injectable()
class GetBussinessCommentsUseCase {

  final ICommentRepository _repository = getIt<CommentRepository>();

  Future<List<CommentInterceptor>?> run(String bussinessId) async {
    return await _repository.getBussinessComments(bussinessId);
  }
}