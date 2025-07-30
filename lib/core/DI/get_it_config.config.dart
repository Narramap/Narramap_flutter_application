// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:narramap/auth/data/repository/auth_repository.dart' as _i365;
import 'package:narramap/auth/domain/use_cases/login_use_case.dart' as _i801;
import 'package:narramap/auth/domain/use_cases/register_use_case.dart' as _i363;
import 'package:narramap/bussiness/data/repository/bussiness_model_prediction_repository.dart'
    as _i988;
import 'package:narramap/bussiness/data/repository/bussiness_repository.dart'
    as _i119;
import 'package:narramap/bussiness/domain/use_cases/get_all_bussiness_use_case.dart'
    as _i726;
import 'package:narramap/bussiness/domain/use_cases/get_average_rating_use_case.dart'
    as _i97;
import 'package:narramap/bussiness/domain/use_cases/get_bussiness_by_id_use_case.dart'
    as _i197;
import 'package:narramap/bussiness/domain/use_cases/get_bussiness_use_case.dart'
    as _i2;
import 'package:narramap/bussiness/domain/use_cases/get_ratings_use_case.dart'
    as _i56;
import 'package:narramap/bussiness/domain/use_cases/predict_bussiness_demand_use_case.dart'
    as _i270;
import 'package:narramap/bussiness/domain/use_cases/rate_bussiness_use_case.dart'
    as _i963;
import 'package:narramap/bussiness/domain/use_cases/register_bussiness_use_case.dart'
    as _i900;
import 'package:narramap/bussiness/domain/use_cases/update_bussiness_use_case.dart'
    as _i638;
import 'package:narramap/comments/data/repository/comment_repository.dart'
    as _i1061;
import 'package:narramap/comments/domain/use_cases/comment_bussiness_use_case.dart'
    as _i978;
import 'package:narramap/comments/domain/use_cases/comment_event_use_case.dart'
    as _i842;
import 'package:narramap/comments/domain/use_cases/comment_post_use_case.dart'
    as _i748;
import 'package:narramap/comments/domain/use_cases/delete_comment_use_case.dart'
    as _i990;
import 'package:narramap/comments/domain/use_cases/get_bussiness_comments_use_case.dart'
    as _i825;
import 'package:narramap/comments/domain/use_cases/get_event_comments_use_case.dart'
    as _i538;
import 'package:narramap/comments/domain/use_cases/get_post_comments_use_case.dart'
    as _i1053;
import 'package:narramap/events/data/repository/event_repository_impl.dart'
    as _i713;
import 'package:narramap/events/domain/use_cases/confirm_event_assistency_use_case.dart'
    as _i151;
import 'package:narramap/events/domain/use_cases/event_use_case.dart' as _i1041;
import 'package:narramap/events/domain/use_cases/get_all_events_use_case.dart'
    as _i766;
import 'package:narramap/events/domain/use_cases/get_event_assistencies_use_case.dart'
    as _i457;
import 'package:narramap/posts/data/repository/posts_repository.dart' as _i406;
import 'package:narramap/posts/domain/use_cases/delete_post_use_case.dart'
    as _i576;
import 'package:narramap/posts/domain/use_cases/get_all_emotional_posts_use_case.dart'
    as _i667;
import 'package:narramap/posts/domain/use_cases/get_all_posts_use_case.dart'
    as _i810;
import 'package:narramap/posts/domain/use_cases/react_to_post_use_case.dart'
    as _i99;
import 'package:narramap/posts/domain/use_cases/register_use_case.dart'
    as _i1043;
import 'package:narramap/posts/domain/use_cases/register_view_use_case.dart'
    as _i159;
import 'package:narramap/posts/domain/use_cases/report_post_use_case.dart'
    as _i381;
import 'package:narramap/users/data/repository/user_repository.dart' as _i575;
import 'package:narramap/users/domain/use_cases/add_phrase_use_case.dart'
    as _i282;
import 'package:narramap/users/domain/use_cases/get_phrases_use_case.dart'
    as _i385;
import 'package:narramap/users/domain/use_cases/get_user_events_use_case.dart'
    as _i353;
import 'package:narramap/users/domain/use_cases/get_user_posts_use_case.dart'
    as _i204;
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart'
    as _i671;
import 'package:narramap/users/domain/use_cases/report_user_use_case.dart'
    as _i1011;
import 'package:narramap/users/domain/use_cases/update_profile_use_case.dart'
    as _i1043;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i365.AuthRepository>(() => _i365.AuthRepository());
    gh.factory<_i801.LoginUseCase>(() => _i801.LoginUseCase());
    gh.factory<_i363.RegisterUseCase>(() => _i363.RegisterUseCase());
    gh.factory<_i671.GetUserProfileUseCase>(
      () => _i671.GetUserProfileUseCase(),
    );
    gh.factory<_i385.GetPhrasesUseCase>(() => _i385.GetPhrasesUseCase());
    gh.factory<_i282.AddPhraseUseCase>(() => _i282.AddPhraseUseCase());
    gh.factory<_i204.GetUserPostsUseCase>(() => _i204.GetUserPostsUseCase());
    gh.factory<_i1043.UpdateProfileUseCase>(
      () => _i1043.UpdateProfileUseCase(),
    );
    gh.factory<_i353.GetUserEventsUseCase>(() => _i353.GetUserEventsUseCase());
    gh.factory<_i1011.ReportUserUseCase>(() => _i1011.ReportUserUseCase());
    gh.factory<_i575.UserRepository>(() => _i575.UserRepository());
    gh.factory<_i900.RegisterBussinessUseCase>(
      () => _i900.RegisterBussinessUseCase(),
    );
    gh.factory<_i2.GetBussinessUseCase>(() => _i2.GetBussinessUseCase());
    gh.factory<_i97.GetAverageRatingUseCase>(
      () => _i97.GetAverageRatingUseCase(),
    );
    gh.factory<_i56.GetRatingsUseCase>(() => _i56.GetRatingsUseCase());
    gh.factory<_i197.GetBussinessByIdUseCase>(
      () => _i197.GetBussinessByIdUseCase(),
    );
    gh.factory<_i638.UpdateBussinessUseCase>(
      () => _i638.UpdateBussinessUseCase(),
    );
    gh.factory<_i726.GetAllBussinessUseCase>(
      () => _i726.GetAllBussinessUseCase(),
    );
    gh.factory<_i119.BussinessRepository>(() => _i119.BussinessRepository());
    gh.factory<_i963.RateBussinessUseCase>(() => _i963.RateBussinessUseCase());
    gh.factory<_i988.BussinessModelPredictionRepository>(
      () => _i988.BussinessModelPredictionRepository(),
    );
    gh.factory<_i270.PredictBussinessDemandUseCase>(
      () => _i270.PredictBussinessDemandUseCase(),
    );
    gh.factory<_i406.PostsRepository>(() => _i406.PostsRepository());
    gh.factory<_i1043.RegisterUseCase>(() => _i1043.RegisterUseCase());
    gh.factory<_i99.ReactToPostUseCase>(() => _i99.ReactToPostUseCase());
    gh.factory<_i381.ReportPostUseCase>(() => _i381.ReportPostUseCase());
    gh.factory<_i159.RegisterViewUseCase>(() => _i159.RegisterViewUseCase());
    gh.factory<_i810.GetAllPostsUseCase>(() => _i810.GetAllPostsUseCase());
    gh.factory<_i667.GetAllEmotionalPostsUseCase>(
      () => _i667.GetAllEmotionalPostsUseCase(),
    );
    gh.factory<_i576.DeletePostUseCase>(() => _i576.DeletePostUseCase());
    gh.factory<_i1041.EventUseCase>(() => _i1041.EventUseCase());
    gh.factory<_i457.GetEventAssistenciesUseCase>(
      () => _i457.GetEventAssistenciesUseCase(),
    );
    gh.factory<_i151.ConfirmEventAssistencyUseCase>(
      () => _i151.ConfirmEventAssistencyUseCase(),
    );
    gh.factory<_i766.GetAllEventsUseCase>(() => _i766.GetAllEventsUseCase());
    gh.factory<_i713.EventRepositoryImpl>(() => _i713.EventRepositoryImpl());
    gh.factory<_i842.CommentEventUseCase>(() => _i842.CommentEventUseCase());
    gh.factory<_i748.CommentPostUseCase>(() => _i748.CommentPostUseCase());
    gh.factory<_i990.DeleteCommentUseCase>(() => _i990.DeleteCommentUseCase());
    gh.factory<_i538.GetEventCommentsUseCase>(
      () => _i538.GetEventCommentsUseCase(),
    );
    gh.factory<_i1053.GetPostCommentsUseCase>(
      () => _i1053.GetPostCommentsUseCase(),
    );
    gh.factory<_i1061.CommentRepository>(() => _i1061.CommentRepository());
    gh.factory<_i825.GetBussinessCommentsUseCase>(
      () => _i825.GetBussinessCommentsUseCase(),
    );
    gh.factory<_i978.CommentBussinessUseCase>(
      () => _i978.CommentBussinessUseCase(),
    );
    return this;
  }
}
