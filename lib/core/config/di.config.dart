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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/api_services.dart' as _i394;
import '../../api/data_source/local/onboarding/onboarding_local_data_source_impl.dart'
    as _i382;
import '../../api/data_source/remote/login/login_remote_data_source_impl.dart'
    as _i226;
import '../../api/data_source/remote/signup/signup_remote_data_source_impl.dart'
    as _i85;
import '../../api/dio/dio_module.dart' as _i67;
import '../../data/data_source/local/onboarding/onboarding_local_data_source.dart'
    as _i697;
import '../../data/data_source/remote/login/login_remote_data_source.dart'
    as _i581;
import '../../data/data_source/remote/signup/signup_remote_data_source.dart'
    as _i912;
import '../../data/repo_impl/login/login_repo_impl.dart' as _i274;
import '../../data/repo_impl/onboarding/onboarding_repo_impl.dart' as _i209;
import '../../data/repo_impl/signup/signup_repo_impl.dart' as _i1018;
import '../../domain/repo/login/login_repo.dart' as _i253;
import '../../domain/repo/onboarding/onboarding_repo.dart' as _i154;
import '../../domain/repo/signup/signup_repo.dart' as _i671;
import '../../domain/usecase/login/login_usecase.dart' as _i623;
import '../../domain/usecase/onboarding/onboarding_usecase.dart' as _i645;
import '../../domain/usecase/signup/signup_usecase.dart' as _i394;
import '../../features/auth/presentation/screen/login/viewModel/login_cubit.dart'
    as _i407;
import '../../features/auth/presentation/screen/signup/viewmodel/signup_cubit.dart'
    as _i461;
import '../../features/onboarding_screen/viewmodel/onboarding_cubit.dart'
    as _i1035;

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
    gh.factory<_i697.OnboardingLocalDataSource>(
      () => _i382.OnboardingLocalDataSourceImpl(),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i394.ApiServices>(
      () => dioModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i154.OnboardingRepo>(
      () => _i209.OnboardingRepoImpl(
        localDataSource: gh<_i697.OnboardingLocalDataSource>(),
      ),
    );
    gh.factory<_i645.OnboardingUseCase>(
      () => _i645.OnboardingUseCase(onboardingRepo: gh<_i154.OnboardingRepo>()),
    );
    gh.factory<_i1035.OnboardingCubit>(
      () => _i1035.OnboardingCubit(
        onboardingUseCase: gh<_i645.OnboardingUseCase>(),
      ),
    );
    gh.factory<_i581.LoginRemoteDataSource>(
      () => _i226.LoginRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i912.SignupRemoteDataSource>(
      () => _i85.SignupRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i253.LoginRepo>(
      () => _i274.LoginRepoImpl(gh<_i581.LoginRemoteDataSource>()),
    );
    gh.factory<_i671.SignupRepo>(
      () => _i1018.SignupRepoImpl(
        signupRemoteDataSource: gh<_i912.SignupRemoteDataSource>(),
      ),
    );
    gh.factory<_i394.SignupUsecase>(
      () => _i394.SignupUsecase(signupRepo: gh<_i671.SignupRepo>()),
    );
    gh.factory<_i623.LoginUsecase>(
      () => _i623.LoginUsecase(gh<_i253.LoginRepo>()),
    );
    gh.factory<_i461.SignupCubit>(
      () => _i461.SignupCubit(gh<_i394.SignupUsecase>()),
    );
    gh.factory<_i407.LoginCubit>(
      () => _i407.LoginCubit(gh<_i623.LoginUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i67.DioModule {}
