// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/api_services.dart' as _i394;
import '../../api/data_source/local/onboarding/onboarding_local_data_source_impl.dart'
    as _i382;
import '../../api/data_source/remote/login/login_remote_data_source_impl.dart'
    as _i226;
import '../../api/data_source/remote/logout/logout_remote_data_source_impl.dart'
    as _i12;
import '../../api/data_source/remote/profile/get_profile_remote_data_source_impl.dart'
    as _i130;
import '../../api/data_source/remote/profile/update_profile_remote_data_source_impl.dart'
    as _i299;
import '../../api/data_source/remote/refresh/refresh_remote_data_source_impl.dart'
    as _i775;
import '../../api/data_source/remote/signup/signup_remote_data_source_impl.dart'
    as _i85;
import '../../api/dio/dio_interceptor.dart' as _i600;
import '../../api/dio/dio_module.dart' as _i67;
import '../../data/data_source/local/onboarding/onboarding_local_data_source.dart'
    as _i697;
import '../../data/data_source/remote/login/login_remote_data_source.dart'
    as _i581;
import '../../data/data_source/remote/logout/logout_remote_data_source.dart'
    as _i887;
import '../../data/data_source/remote/profile/get_profile_remote_data_source.dart'
    as _i1011;
import '../../data/data_source/remote/profile/update_profile_remote_data_source.dart'
    as _i26;
import '../../data/data_source/remote/refresh/refresh_remote_data_source.dart'
    as _i394;
import '../../data/data_source/remote/signup/signup_remote_data_source.dart'
    as _i912;
import '../../data/repo_impl/auth/token_storage_impl.dart' as _i241;
import '../../data/repo_impl/login/login_repo_impl.dart' as _i274;
import '../../data/repo_impl/logout/logout_repo_impl.dart' as _i238;
import '../../data/repo_impl/onboarding/onboarding_repo_impl.dart' as _i209;
import '../../data/repo_impl/profile/get_profile_repo_impl.dart' as _i904;
import '../../data/repo_impl/profile/update_profile_repo_impl.dart' as _i577;
import '../../data/repo_impl/refresh/refresh_repo_impl.dart' as _i597;
import '../../data/repo_impl/signup/signup_repo_impl.dart' as _i1018;
import '../../domain/repo/auth/token_storage.dart' as _i232;
import '../../domain/repo/login/login_repo.dart' as _i253;
import '../../domain/repo/logout/logout_repo.dart' as _i425;
import '../../domain/repo/onboarding/onboarding_repo.dart' as _i154;
import '../../domain/repo/profile/get_profile_repo.dart' as _i494;
import '../../domain/repo/profile/update_profile_repo.dart' as _i884;
import '../../domain/repo/refresh/refresh_repo.dart' as _i996;
import '../../domain/repo/signup/signup_repo.dart' as _i671;
import '../../domain/usecase/login/login_usecase.dart' as _i623;
import '../../domain/usecase/logout/logout_usecase.dart' as _i238;
import '../../domain/usecase/onboarding/onboarding_usecase.dart' as _i645;
import '../../domain/usecase/profile/get_profile_usecase.dart' as _i152;
import '../../domain/usecase/profile/update_profile_usecase.dart' as _i1049;
import '../../domain/usecase/refresh/refresh_usecase.dart' as _i811;
import '../../domain/usecase/signup/signup_usecase.dart' as _i394;
import '../../features/auth/presentation/screen/login/viewModel/login_cubit.dart'
    as _i407;
import '../../features/auth/presentation/screen/signup/viewmodel/signup_cubit.dart'
    as _i461;
import '../../features/main/tabs/profile/viewmodel/logout/logout_cubit.dart'
    as _i540;
import '../../features/main/tabs/profile/viewmodel/profile/profile_cubit.dart'
    as _i315;
import '../../features/onboarding_screen/viewmodel/onboarding_cubit.dart'
    as _i1035;
import 'storage_module.dart' as _i371;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final storageModule = _$StorageModule();
    gh.singleton<_i361.BaseOptions>(() => dioModule.provideBaseOption());
    gh.singleton<_i528.PrettyDioLogger>(() => dioModule.providePrettyLogger());
    gh.singleton<_i558.FlutterSecureStorage>(
      () => storageModule.provideSecureStorage(),
    );
    gh.factory<_i697.OnboardingLocalDataSource>(
      () => _i382.OnboardingLocalDataSourceImpl(),
    );
    gh.factory<_i154.OnboardingRepo>(
      () => _i209.OnboardingRepoImpl(
        localDataSource: gh<_i697.OnboardingLocalDataSource>(),
      ),
    );
    gh.factory<_i645.OnboardingUseCase>(
      () => _i645.OnboardingUseCase(onboardingRepo: gh<_i154.OnboardingRepo>()),
    );
    gh.lazySingleton<_i232.TokenStorage>(
      () => _i241.TokenStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i600.DioInterceptor>(
      () => _i600.DioInterceptor(gh<_i232.TokenStorage>()),
    );
    gh.factory<_i1035.OnboardingCubit>(
      () => _i1035.OnboardingCubit(
        onboardingUseCase: gh<_i645.OnboardingUseCase>(),
      ),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i600.DioInterceptor>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i394.ApiServices>(
      () => dioModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i394.RefreshRemoteDataSource>(
      () => _i775.RefreshRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i887.LogoutRemoteDataSource>(
      () => _i12.LogoutRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i996.RefreshRepo>(
      () => _i597.RefreshRepoImpl(gh<_i394.RefreshRemoteDataSource>()),
    );
    gh.factory<_i811.RefreshUsecase>(
      () => _i811.RefreshUsecase(gh<_i996.RefreshRepo>()),
    );
    gh.factory<_i26.UpdateProfileRemoteDataSource>(
      () => _i299.UpdateProfileRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i884.UpdateProfileRepo>(
      () =>
          _i577.UpdateProfileRepoImpl(gh<_i26.UpdateProfileRemoteDataSource>()),
    );
    gh.factory<_i1049.UpdateProfileUseCase>(
      () => _i1049.UpdateProfileUseCase(gh<_i884.UpdateProfileRepo>()),
    );
    gh.factory<_i581.LoginRemoteDataSource>(
      () => _i226.LoginRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i1011.GetProfileRemoteDataSource>(
      () => _i130.GetProfileRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i912.SignupRemoteDataSource>(
      () => _i85.SignupRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i425.LogoutRepo>(
      () => _i238.LogoutRepoImpl(
        gh<_i887.LogoutRemoteDataSource>(),
        gh<_i232.TokenStorage>(),
      ),
    );
    gh.factory<_i494.GetProfileRepo>(
      () => _i904.GetProfileRepoImpl(gh<_i1011.GetProfileRemoteDataSource>()),
    );
    gh.factory<_i253.LoginRepo>(
      () => _i274.LoginRepoImpl(gh<_i581.LoginRemoteDataSource>()),
    );
    gh.factory<_i238.LogoutUseCase>(
      () => _i238.LogoutUseCase(gh<_i425.LogoutRepo>()),
    );
    gh.factory<_i671.SignupRepo>(
      () => _i1018.SignupRepoImpl(
        signupRemoteDataSource: gh<_i912.SignupRemoteDataSource>(),
      ),
    );
    gh.factory<_i152.GetProfileUseCase>(
      () => _i152.GetProfileUseCase(gh<_i494.GetProfileRepo>()),
    );
    gh.factory<_i394.SignupUsecase>(
      () => _i394.SignupUsecase(signupRepo: gh<_i671.SignupRepo>()),
    );
    gh.factory<_i623.LoginUsecase>(
      () => _i623.LoginUsecase(gh<_i253.LoginRepo>()),
    );
    gh.factory<_i540.LogoutCubit>(
      () => _i540.LogoutCubit(gh<_i238.LogoutUseCase>()),
    );
    gh.factory<_i461.SignupCubit>(
      () => _i461.SignupCubit(
        gh<_i394.SignupUsecase>(),
        gh<_i232.TokenStorage>(),
      ),
    );
    gh.factory<_i315.ProfileCubit>(
      () => _i315.ProfileCubit(
        gh<_i152.GetProfileUseCase>(),
        gh<_i1049.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i407.LoginCubit>(
      () =>
          _i407.LoginCubit(gh<_i623.LoginUsecase>(), gh<_i232.TokenStorage>()),
    );
    return this;
  }
}

class _$DioModule extends _i67.DioModule {}

class _$StorageModule extends _i371.StorageModule {}
