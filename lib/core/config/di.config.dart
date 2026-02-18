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
import 'package:mock_mate_ai/api/api_services.dart' as _i868;
import 'package:mock_mate_ai/api/data_source/local/onboarding/onboarding_local_data_source_impl.dart'
    as _i165;
import 'package:mock_mate_ai/api/data_source/remote/signup/signup_remote_data_source_impl.dart'
    as _i159;
import 'package:mock_mate_ai/api/dio/dio_module.dart' as _i36;
import 'package:mock_mate_ai/data/data_source/local/onboarding/onboarding_local_data_source.dart'
    as _i759;
import 'package:mock_mate_ai/data/data_source/remote/signup/signup_remote_data_source.dart'
    as _i397;
import 'package:mock_mate_ai/data/repo_impl/onboarding/onboarding_repo_impl.dart'
    as _i26;
import 'package:mock_mate_ai/data/repo_impl/signup/signup_repo_impl.dart'
    as _i26;
import 'package:mock_mate_ai/domain/repo/onboarding/onboarding_repo.dart'
    as _i888;
import 'package:mock_mate_ai/domain/repo/signup/signup_repo.dart' as _i467;
import 'package:mock_mate_ai/domain/usecase/onboarding/onboarding_usecase.dart'
    as _i817;
import 'package:mock_mate_ai/domain/usecase/signup/signup_usecase.dart'
    as _i835;
import 'package:mock_mate_ai/features/auth/presentation/screen/signup/viewmodel/signup_cubit.dart'
    as _i725;
import 'package:mock_mate_ai/features/onboarding_screen/viewmodel/onboarding_cubit.dart'
    as _i275;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.BaseOptions>(() => dioModule.provideBaseOption());
    gh.singleton<_i528.PrettyDioLogger>(() => dioModule.providePrettyLogger());
    gh.factory<_i759.OnboardingLocalDataSource>(
      () => _i165.OnboardingLocalDataSourceImpl(),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i888.OnboardingRepo>(
      () => _i26.OnboardingRepoImpl(
        localDataSource: gh<_i759.OnboardingLocalDataSource>(),
      ),
    );
    gh.singleton<_i868.ApiServices>(
      () => dioModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i817.OnboardingUseCase>(
      () => _i817.OnboardingUseCase(onboardingRepo: gh<_i888.OnboardingRepo>()),
    );
    gh.factory<_i275.OnboardingCubit>(
      () => _i275.OnboardingCubit(
        onboardingUseCase: gh<_i817.OnboardingUseCase>(),
      ),
    );
    gh.factory<_i397.SignupRemoteDataSource>(
      () => _i159.SignupRemoteDataSourceImpl(gh<_i868.ApiServices>()),
    );
    gh.factory<_i467.SignupRepo>(
      () => _i26.SignupRepoImpl(
        signupRemoteDataSource: gh<_i397.SignupRemoteDataSource>(),
      ),
    );
    gh.factory<_i835.SignupUsecase>(
      () => _i835.SignupUsecase(signupRepo: gh<_i467.SignupRepo>()),
    );
    gh.factory<_i725.SignupCubit>(
      () => _i725.SignupCubit(gh<_i835.SignupUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i36.DioModule {}
