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
import 'package:narramap/auth/domain/use_cases/register_use_case.dart' as _i363;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i365.AuthRepository>(() => _i365.AuthRepository());
    gh.factory<_i363.RegisterUseCase>(() => _i363.RegisterUseCase());
    return this;
  }
}
