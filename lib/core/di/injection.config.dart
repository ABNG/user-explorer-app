// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repository/user_repository_impl.dart' as _i568;
import '../../data/service/json_placeholder_user_service.dart' as _i940;
import '../../domain/repository/user_repository.dart' as _i566;
import 'module/network_module.dart' as _i881;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<String>(() => networkModule.baseUrl, instanceName: 'baseUrl');
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<String>(instanceName: 'baseUrl')),
    );
    gh.lazySingleton<_i940.JsonPlaceholderUserService>(
      () => _i940.JsonPlaceholderUserService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i566.UserRepository>(
      () => _i568.UserRepositoryImpl(gh<_i940.JsonPlaceholderUserService>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i881.NetworkModule {}
