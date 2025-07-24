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
import 'package:narramap/content/data/repository/event_repository_impl.dart'
    as _i150;
import 'package:narramap/content/data/repository/posts_repository.dart'
    as _i1007;
import 'package:narramap/content/domain/use_cases/comment_event_use_case.dart'
    as _i63;
import 'package:narramap/content/domain/use_cases/comment_post_use_case.dart'
    as _i655;
import 'package:narramap/content/domain/use_cases/delete_comment_use_case.dart'
    as _i678;
import 'package:narramap/content/domain/use_cases/event_use_case.dart' as _i531;
import 'package:narramap/content/domain/use_cases/get_event_comments_use_case.dart'
    as _i626;
import 'package:narramap/content/domain/use_cases/get_post_comments_use_case.dart'
    as _i449;
import 'package:narramap/content/domain/use_cases/react_to_post_use_case.dart'
    as _i437;
import 'package:narramap/content/domain/use_cases/register_use_case.dart'
    as _i102;
import 'package:narramap/map/domain/use_cases/get_all_events_use_case.dart'
    as _i111;
import 'package:narramap/map/domain/use_cases/get_all_posts_use_case.dart'
    as _i107;
import 'package:narramap/map/domain/use_cases/register_view_use_case.dart'
    as _i406;
import 'package:narramap/shared/data/repository/comment_repository.dart'
    as _i924;
import 'package:narramap/users/data/repository/user_repository.dart' as _i575;
import 'package:narramap/users/domain/use_cases/add_phrase_use_case.dart'
    as _i282;
import 'package:narramap/users/domain/use_cases/delete_post_use_case.dart'
    as _i744;
import 'package:narramap/users/domain/use_cases/get_phrases_use_case.dart'
    as _i385;
import 'package:narramap/users/domain/use_cases/get_user_events_use_case.dart'
    as _i353;
import 'package:narramap/users/domain/use_cases/get_user_posts_use_case.dart'
    as _i204;
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart'
    as _i671;
import 'package:narramap/users/domain/use_cases/update_profile_use_case.dart'
    as _i1043;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i107.GetAllPostsUseCase>(() => _i107.GetAllPostsUseCase());
    gh.factory<_i111.GetAllEventsUseCase>(() => _i111.GetAllEventsUseCase());
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
    gh.factory<_i575.UserRepository>(() => _i575.UserRepository());
    gh.factory<_i924.CommentRepository>(() => _i924.CommentRepository());
    gh.factory<_i102.RegisterUseCase>(() => _i102.RegisterUseCase());
    gh.factory<_i437.ReactToPostUseCase>(() => _i437.ReactToPostUseCase());
    gh.factory<_i531.EventUseCase>(() => _i531.EventUseCase());
    gh.factory<_i655.CommentPostUseCase>(() => _i655.CommentPostUseCase());
    gh.factory<_i449.GetPostCommentsUseCase>(
      () => _i449.GetPostCommentsUseCase(),
    );
    gh.factory<_i626.GetEventCommentsUseCase>(
      () => _i626.GetEventCommentsUseCase(),
    );
    gh.factory<_i63.CommentEventUseCase>(() => _i63.CommentEventUseCase());
    gh.factory<_i150.EventRepositoryImpl>(() => _i150.EventRepositoryImpl());
    gh.factory<_i1007.PostsRepository>(() => _i1007.PostsRepository());
    gh.factory<_i406.RegisterViewUseCase>(() => _i406.RegisterViewUseCase());
    gh.factory<_i744.DeletePostUseCase>(() => _i744.DeletePostUseCase());
    gh.factory<_i678.DeleteCommentUseCase>(() => _i678.DeleteCommentUseCase());
    return this;
  }
}
