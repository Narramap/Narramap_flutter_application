
import 'package:injectable/injectable.dart';
import 'package:narramap/posts/data/dto/create_report_dto.dart';
import 'package:narramap/posts/data/repository/posts_repository.dart';
import 'package:narramap/posts/domain/model/report.dart';
import 'package:narramap/posts/domain/repository/i_posts_repository.dart';
import 'package:narramap/core/DI/get_it_config.dart';

@Injectable()
class ReportPostUseCase {
  
  final IPostsRepository repository = getIt<PostsRepository>();

  Future<ReportEntity?> run(String postId, CreateReportDto reportDTO) async{
    
    return await repository.reportPost(postId, reportDTO);

  }
}