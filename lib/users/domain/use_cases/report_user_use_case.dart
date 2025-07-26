
import 'package:injectable/injectable.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/users/data/dto/user_report_dto.dart';
import 'package:narramap/users/data/interceptors/user_report_interceptor.dart';
import 'package:narramap/users/data/repository/user_repository.dart';
import 'package:narramap/users/domain/repository/i_user_repository.dart';

@Injectable()
class ReportUserUseCase {

  final IUserRepository repository = getIt<UserRepository>();

  Future<UserReportInterceptor?> run(UserReportDto userReportDTO) async {
     return await repository.reportUserById(userReportDTO);
  }
}