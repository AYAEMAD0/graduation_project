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
import 'package:mock_mate_ai/api/api_services.dart' as _i868;
import 'package:mock_mate_ai/api/data_source/local/onboarding/onboarding_local_data_source_impl.dart'
    as _i165;
import 'package:mock_mate_ai/api/data_source/remote/auth/login/login_remote_data_source_impl.dart'
    as _i856;
import 'package:mock_mate_ai/api/data_source/remote/auth/logout/logout_remote_data_source_impl.dart'
    as _i1003;
import 'package:mock_mate_ai/api/data_source/remote/auth/refresh/refresh_remote_data_source_impl.dart'
    as _i974;
import 'package:mock_mate_ai/api/data_source/remote/auth/signup/signup_remote_data_source_impl.dart'
    as _i98;
import 'package:mock_mate_ai/api/data_source/remote/profile/get_profile_remote_data_source_impl.dart'
    as _i416;
import 'package:mock_mate_ai/api/data_source/remote/profile/update_profile_remote_data_source_impl.dart'
    as _i439;
import 'package:mock_mate_ai/api/data_source/remote/session/interview_session/interview_session_remote_data_source_impl.dart'
    as _i294;
import 'package:mock_mate_ai/api/data_source/remote/session/submit_code/submit_code_remote_data_source_impl.dart'
    as _i647;
import 'package:mock_mate_ai/api/dio/dio_interceptor.dart' as _i346;
import 'package:mock_mate_ai/api/dio/dio_module.dart' as _i36;
import 'package:mock_mate_ai/core/config/storage_module.dart' as _i782;
import 'package:mock_mate_ai/data/data_source/local/onboarding/onboarding_local_data_source.dart'
    as _i759;
import 'package:mock_mate_ai/data/data_source/remote/auth/login/login_remote_data_source.dart'
    as _i211;
import 'package:mock_mate_ai/data/data_source/remote/auth/logout/logout_remote_data_source.dart'
    as _i638;
import 'package:mock_mate_ai/data/data_source/remote/auth/refresh/refresh_remote_data_source.dart'
    as _i85;
import 'package:mock_mate_ai/data/data_source/remote/auth/signup/signup_remote_data_source.dart'
    as _i179;
import 'package:mock_mate_ai/data/data_source/remote/profile/get_profile_remote_data_source.dart'
    as _i879;
import 'package:mock_mate_ai/data/data_source/remote/profile/update_profile_remote_data_source.dart'
    as _i0;
import 'package:mock_mate_ai/data/data_source/remote/session/interview_session/interview_session_remote_data_source.dart'
    as _i764;
import 'package:mock_mate_ai/data/data_source/remote/session/submit_code/submit_code_remote_data_source.dart'
    as _i417;
import 'package:mock_mate_ai/data/repo_impl/auth/login/login_repo_impl.dart'
    as _i919;
import 'package:mock_mate_ai/data/repo_impl/auth/logout/logout_repo_impl.dart'
    as _i537;
import 'package:mock_mate_ai/data/repo_impl/auth/refresh/refresh_repo_impl.dart'
    as _i447;
import 'package:mock_mate_ai/data/repo_impl/auth/signup/signup_repo_impl.dart'
    as _i737;
import 'package:mock_mate_ai/data/repo_impl/auth/token/token_storage_impl.dart'
    as _i189;
import 'package:mock_mate_ai/data/repo_impl/onboarding/onboarding_repo_impl.dart'
    as _i26;
import 'package:mock_mate_ai/data/repo_impl/profile/get_profile_repo_impl.dart'
    as _i625;
import 'package:mock_mate_ai/data/repo_impl/profile/update_profile_repo_impl.dart'
    as _i346;
import 'package:mock_mate_ai/data/repo_impl/session/interview_session/interview_session_repo_impl.dart'
    as _i273;
import 'package:mock_mate_ai/data/repo_impl/session/submit_code/submit_code_repo_impl.dart'
    as _i896;
import 'package:mock_mate_ai/domain/repo/auth/login/login_repo.dart' as _i344;
import 'package:mock_mate_ai/domain/repo/auth/logout/logout_repo.dart' as _i182;
import 'package:mock_mate_ai/domain/repo/auth/refresh/refresh_repo.dart'
    as _i608;
import 'package:mock_mate_ai/domain/repo/auth/signup/signup_repo.dart' as _i538;
import 'package:mock_mate_ai/domain/repo/auth/token/token_storage.dart'
    as _i788;
import 'package:mock_mate_ai/domain/repo/onboarding/onboarding_repo.dart'
    as _i888;
import 'package:mock_mate_ai/domain/repo/profile/get_profile_repo.dart'
    as _i229;
import 'package:mock_mate_ai/domain/repo/profile/update_profile_repo.dart'
    as _i373;
import 'package:mock_mate_ai/domain/repo/session/interview_session/interview_session_repo.dart'
    as _i130;
import 'package:mock_mate_ai/domain/repo/session/submit_code/submit_code_repo.dart'
    as _i297;
import 'package:mock_mate_ai/domain/usecase/auth/login/login_usecase.dart'
    as _i284;
import 'package:mock_mate_ai/domain/usecase/auth/logout/logout_usecase.dart'
    as _i463;
import 'package:mock_mate_ai/domain/usecase/auth/refresh/refresh_usecase.dart'
    as _i753;
import 'package:mock_mate_ai/domain/usecase/auth/signup/signup_usecase.dart'
    as _i44;
import 'package:mock_mate_ai/domain/usecase/onboarding/onboarding_usecase.dart'
    as _i817;
import 'package:mock_mate_ai/domain/usecase/profile/get_profile_usecase.dart'
    as _i302;
import 'package:mock_mate_ai/domain/usecase/profile/update_profile_usecase.dart'
    as _i1065;
import 'package:mock_mate_ai/domain/usecase/session/interview_session/interview_session_usecase.dart'
    as _i992;
import 'package:mock_mate_ai/domain/usecase/session/submit_code/submit_code_usecase.dart'
    as _i666;
import 'package:mock_mate_ai/features/auth/presentation/screen/login/viewModel/login_cubit.dart'
    as _i652;
import 'package:mock_mate_ai/features/auth/presentation/screen/signup/viewmodel/signup_cubit.dart'
    as _i725;
import 'package:mock_mate_ai/features/main/tabs/profile/viewmodel/logout/logout_cubit.dart'
    as _i191;
import 'package:mock_mate_ai/features/main/tabs/profile/viewmodel/profile/profile_cubit.dart'
    as _i942;
import 'package:mock_mate_ai/features/onboarding_screen/viewmodel/onboarding_cubit.dart'
    as _i275;
import 'package:mock_mate_ai/features/session/viewmodel/interview_session/interview_session_cubit.dart'
    as _i685;
import 'package:mock_mate_ai/features/session/viewmodel/submit_code/submit_code_cubit.dart'
    as _i257;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

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
    gh.factory<_i759.OnboardingLocalDataSource>(
      () => _i165.OnboardingLocalDataSourceImpl(),
    );
    gh.factory<_i888.OnboardingRepo>(
      () => _i26.OnboardingRepoImpl(
        localDataSource: gh<_i759.OnboardingLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i788.TokenStorage>(
      () => _i189.TokenStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i817.OnboardingUseCase>(
      () => _i817.OnboardingUseCase(onboardingRepo: gh<_i888.OnboardingRepo>()),
    );
    gh.factory<_i275.OnboardingCubit>(
      () => _i275.OnboardingCubit(
        onboardingUseCase: gh<_i817.OnboardingUseCase>(),
      ),
    );
    gh.lazySingleton<_i346.DioInterceptor>(
      () => _i346.DioInterceptor(gh<_i788.TokenStorage>()),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i346.DioInterceptor>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.lazySingleton<_i85.RefreshRemoteDataSource>(
      () => _i974.RefreshRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i608.RefreshRepo>(
      () => _i447.RefreshRepoImpl(gh<_i85.RefreshRemoteDataSource>()),
    );
    gh.factory<_i753.RefreshUsecase>(
      () => _i753.RefreshUsecase(gh<_i608.RefreshRepo>()),
    );
    gh.singleton<_i868.ApiServices>(
      () => dioModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i0.UpdateProfileRemoteDataSource>(
      () => _i439.UpdateProfileRemoteDataSourceImpl(gh<_i868.ApiServices>()),
    );
    gh.factory<_i373.UpdateProfileRepo>(
      () =>
          _i346.UpdateProfileRepoImpl(gh<_i0.UpdateProfileRemoteDataSource>()),
    );
    gh.factory<_i179.SignupRemoteDataSource>(
      () => _i98.SignupRemoteDataSourceImpl(gh<_i868.ApiServices>()),
    );
    gh.factory<_i1065.UpdateProfileUseCase>(
      () => _i1065.UpdateProfileUseCase(gh<_i373.UpdateProfileRepo>()),
    );
    gh.factory<_i417.SubmitCodeRemoteDataSource>(
      () => _i647.SubmitCodeRemoteDataSourceImpl(gh<_i868.ApiServices>()),
    );
    gh.factory<_i764.InterviewSessionRemoteDataSource>(
      () => _i294.InterviewSessionRemoteDataSourceImpl(gh<_i868.ApiServices>()),
    );
    gh.factory<_i297.SubmitCodeRepo>(
      () => _i896.SubmitCodeRepoImpl(gh<_i417.SubmitCodeRemoteDataSource>()),
    );
    gh.factory<_i879.GetProfileRemoteDataSource>(
      () => _i416.GetProfileRemoteDataSourceImpl(gh<_i868.ApiServices>()),
    );
    gh.factory<_i211.LoginRemoteDataSource>(
      () => _i856.LoginRemoteDataSourceImpl(gh<_i868.ApiServices>()),
    );
    gh.factory<_i229.GetProfileRepo>(
      () => _i625.GetProfileRepoImpl(gh<_i879.GetProfileRemoteDataSource>()),
    );
    gh.factory<_i538.SignupRepo>(
      () => _i737.SignupRepoImpl(
        signupRemoteDataSource: gh<_i179.SignupRemoteDataSource>(),
      ),
    );
    gh.factory<_i666.SubmitCodeUseCase>(
      () => _i666.SubmitCodeUseCase(gh<_i297.SubmitCodeRepo>()),
    );
    gh.factory<_i638.LogoutRemoteDataSource>(
      () => _i1003.LogoutRemoteDataSourceImpl(gh<_i868.ApiServices>()),
    );
    gh.factory<_i130.InterviewSessionRepo>(
      () => _i273.InterviewSessionRepoImpl(
        gh<_i764.InterviewSessionRemoteDataSource>(),
      ),
    );
    gh.factory<_i344.LoginRepo>(
      () => _i919.LoginRepoImpl(gh<_i211.LoginRemoteDataSource>()),
    );
    gh.factory<_i284.LoginUsecase>(
      () => _i284.LoginUsecase(gh<_i344.LoginRepo>()),
    );
    gh.factory<_i44.SignupUsecase>(
      () => _i44.SignupUsecase(signupRepo: gh<_i538.SignupRepo>()),
    );
    gh.factory<_i302.GetProfileUseCase>(
      () => _i302.GetProfileUseCase(gh<_i229.GetProfileRepo>()),
    );
    gh.factory<_i257.SubmitCodeCubit>(
      () => _i257.SubmitCodeCubit(gh<_i666.SubmitCodeUseCase>()),
    );
    gh.factory<_i182.LogoutRepo>(
      () => _i537.LogoutRepoImpl(
        gh<_i638.LogoutRemoteDataSource>(),
        gh<_i788.TokenStorage>(),
      ),
    );
    gh.factory<_i463.LogoutUseCase>(
      () => _i463.LogoutUseCase(gh<_i182.LogoutRepo>()),
    );
    gh.factory<_i652.LoginCubit>(
      () =>
          _i652.LoginCubit(gh<_i284.LoginUsecase>(), gh<_i788.TokenStorage>()),
    );
    gh.factory<_i191.LogoutCubit>(
      () => _i191.LogoutCubit(gh<_i463.LogoutUseCase>()),
    );
    gh.factory<_i725.SignupCubit>(
      () =>
          _i725.SignupCubit(gh<_i44.SignupUsecase>(), gh<_i788.TokenStorage>()),
    );
    gh.factory<_i942.ProfileCubit>(
      () => _i942.ProfileCubit(
        gh<_i302.GetProfileUseCase>(),
        gh<_i1065.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i992.InterviewSessionUseCase>(
      () => _i992.InterviewSessionUseCase(gh<_i130.InterviewSessionRepo>()),
    );
    gh.factory<_i685.InterviewSessionCubit>(
      () => _i685.InterviewSessionCubit(gh<_i992.InterviewSessionUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i36.DioModule {}

class _$StorageModule extends _i782.StorageModule {}
