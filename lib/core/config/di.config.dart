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
import '../../api/data_source/remote/auth/login/login_remote_data_source_impl.dart'
    as _i1021;
import '../../api/data_source/remote/auth/logout/logout_remote_data_source_impl.dart'
    as _i487;
import '../../api/data_source/remote/auth/refresh/refresh_remote_data_source_impl.dart'
    as _i259;
import '../../api/data_source/remote/auth/signup/signup_remote_data_source_impl.dart'
    as _i368;
import '../../api/data_source/remote/history/history_remote_data_source_impl.dart'
    as _i330;
import '../../api/data_source/remote/profile/get_profile_remote_data_source_impl.dart'
    as _i130;
import '../../api/data_source/remote/profile/update_profile_remote_data_source_impl.dart'
    as _i299;
import '../../api/data_source/remote/session/answer_mcq/answer_mcq_remote_data_source_impl.dart'
    as _i974;
import '../../api/data_source/remote/session/get_session/get_session_remote_data_source_impl.dart'
    as _i550;
import '../../api/data_source/remote/session/interview_session/interview_session_remote_data_source_impl.dart'
    as _i332;
import '../../api/data_source/remote/session/run_code/run_code_remote_data_source_impl.dart'
    as _i328;
import '../../api/data_source/remote/session/submit_answer/submit_answer_remote_data_source_impl.dart'
    as _i725;
import '../../api/data_source/remote/session/submit_code/submit_code_remote_data_source_impl.dart'
    as _i243;
import '../../api/dio/dio_interceptor.dart' as _i600;
import '../../api/dio/dio_module.dart' as _i67;
import '../../data/data_source/local/onboarding/onboarding_local_data_source.dart'
    as _i697;
import '../../data/data_source/remote/auth/login/login_remote_data_source.dart'
    as _i49;
import '../../data/data_source/remote/auth/logout/logout_remote_data_source.dart'
    as _i225;
import '../../data/data_source/remote/auth/refresh/refresh_remote_data_source.dart'
    as _i1004;
import '../../data/data_source/remote/auth/signup/signup_remote_data_source.dart'
    as _i224;
import '../../data/data_source/remote/history/history_remote_data_source.dart'
    as _i748;
import '../../data/data_source/remote/profile/get_profile_remote_data_source.dart'
    as _i1011;
import '../../data/data_source/remote/profile/update_profile_remote_data_source.dart'
    as _i26;
import '../../data/data_source/remote/session/answer_mcq/answer_mcq_remote_data_source.dart'
    as _i386;
import '../../data/data_source/remote/session/get_session/get_session_remote_data_source.dart'
    as _i722;
import '../../data/data_source/remote/session/interview_session/interview_session_remote_data_source.dart'
    as _i291;
import '../../data/data_source/remote/session/run_code/run_code_remote_data_source.dart'
    as _i441;
import '../../data/data_source/remote/session/submit_answer/submit_answer_remote_data_source.dart'
    as _i335;
import '../../data/data_source/remote/session/submit_code/submit_code_remote_data_source.dart'
    as _i343;
import '../../data/repo_impl/auth/login/login_repo_impl.dart' as _i612;
import '../../data/repo_impl/auth/logout/logout_repo_impl.dart' as _i377;
import '../../data/repo_impl/auth/refresh/refresh_repo_impl.dart' as _i462;
import '../../data/repo_impl/auth/signup/signup_repo_impl.dart' as _i820;
import '../../data/repo_impl/auth/token/token_storage_impl.dart' as _i144;
import '../../data/repo_impl/history/history_repo_impl.dart' as _i633;
import '../../data/repo_impl/onboarding/onboarding_repo_impl.dart' as _i209;
import '../../data/repo_impl/profile/get_profile_repo_impl.dart' as _i904;
import '../../data/repo_impl/profile/update_profile_repo_impl.dart' as _i577;
import '../../data/repo_impl/session/answer_mcq/answer_mcq_repo_impl.dart'
    as _i933;
import '../../data/repo_impl/session/get_session/get_session_repo_impl.dart'
    as _i788;
import '../../data/repo_impl/session/interview_session/interview_session_repo_impl.dart'
    as _i816;
import '../../data/repo_impl/session/run_code/run_code_repo_impl.dart' as _i372;
import '../../data/repo_impl/session/submit_answer/submit_answer_repo_impl.dart'
    as _i1020;
import '../../data/repo_impl/session/submit_code/submit_code_repo_impl.dart'
    as _i654;
import '../../domain/repo/auth/login/login_repo.dart' as _i308;
import '../../domain/repo/auth/logout/logout_repo.dart' as _i81;
import '../../domain/repo/auth/refresh/refresh_repo.dart' as _i737;
import '../../domain/repo/auth/signup/signup_repo.dart' as _i788;
import '../../domain/repo/auth/token/token_storage.dart' as _i589;
import '../../domain/repo/history/history_repo.dart' as _i1044;
import '../../domain/repo/onboarding/onboarding_repo.dart' as _i154;
import '../../domain/repo/profile/get_profile_repo.dart' as _i494;
import '../../domain/repo/profile/update_profile_repo.dart' as _i884;
import '../../domain/repo/session/answer_mcq/answer_mcq_repo.dart' as _i969;
import '../../domain/repo/session/get_session/get_session_repo.dart' as _i839;
import '../../domain/repo/session/interview_session/interview_session_repo.dart'
    as _i750;
import '../../domain/repo/session/run_code/run_code_repo.dart' as _i410;
import '../../domain/repo/session/submit_answer/submit_answer_repo.dart'
    as _i134;
import '../../domain/repo/session/submit_code/submit_code_repo.dart' as _i344;
import '../../domain/usecase/auth/login/login_usecase.dart' as _i863;
import '../../domain/usecase/auth/logout/logout_usecase.dart' as _i976;
import '../../domain/usecase/auth/refresh/refresh_usecase.dart' as _i387;
import '../../domain/usecase/auth/signup/signup_usecase.dart' as _i375;
import '../../domain/usecase/history/history_usecase.dart' as _i558;
import '../../domain/usecase/onboarding/onboarding_usecase.dart' as _i645;
import '../../domain/usecase/profile/get_profile_usecase.dart' as _i152;
import '../../domain/usecase/profile/update_profile_usecase.dart' as _i1049;
import '../../domain/usecase/session/answer_mcq/answer_mcq_usecase.dart'
    as _i917;
import '../../domain/usecase/session/get_session/get_session_usecase.dart'
    as _i1040;
import '../../domain/usecase/session/interview_session/interview_session_usecase.dart'
    as _i196;
import '../../domain/usecase/session/run_code/run_code_usecase.dart' as _i372;
import '../../domain/usecase/session/submit_answer/submit_answer_usecase.dart'
    as _i271;
import '../../domain/usecase/session/submit_code/submit_code_usecase.dart'
    as _i473;
import '../../features/auth/presentation/screen/login/viewModel/login_cubit.dart'
    as _i407;
import '../../features/auth/presentation/screen/signup/viewmodel/signup_cubit.dart'
    as _i461;
import '../../features/feedback/viewmodel/get_session/get_session_cubit.dart'
    as _i846;
import '../../features/main/tabs/history/viewModel/history_cubit.dart' as _i234;
import '../../features/main/tabs/profile/viewmodel/logout/logout_cubit.dart'
    as _i540;
import '../../features/main/tabs/profile/viewmodel/profile/profile_cubit.dart'
    as _i315;
import '../../features/onboarding_screen/viewmodel/onboarding_cubit.dart'
    as _i1035;
import '../../features/session/coding_workspace/viewmodel/code_editor/code_editor_cubit.dart'
    as _i941;
import '../../features/session/coding_workspace/viewmodel/run_code/run_code_cubit.dart'
    as _i1051;
import '../../features/session/coding_workspace/viewmodel/submit_code/submit_code_cubit.dart'
    as _i316;
import '../../features/session/mcq_workspace/viewmodel/mcq_workspace_cubit.dart'
    as _i244;
import '../../features/session/question_overview/viewmodel/question_overview_cubit.dart'
    as _i715;
import '../../features/session/question_overview/viewmodel/submit_answer_cubit.dart'
    as _i65;
import '../../features/session/upload_cv_jd/viewmodel/upload_cv_cubit.dart'
    as _i369;
import '../../features/session/viewmodel/interview_session/interview_session_cubit.dart'
    as _i220;
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
    gh.factory<_i941.CodeEditorCubit>(() => _i941.CodeEditorCubit());
    gh.factory<_i715.QuestionOverviewCubit>(
      () => _i715.QuestionOverviewCubit(),
    );
    gh.factory<_i369.UploadCvCubit>(() => _i369.UploadCvCubit());
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
    gh.lazySingleton<_i589.TokenStorage>(
      () => _i144.TokenStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i645.OnboardingUseCase>(
      () => _i645.OnboardingUseCase(onboardingRepo: gh<_i154.OnboardingRepo>()),
    );
    gh.factory<_i1035.OnboardingCubit>(
      () => _i1035.OnboardingCubit(
        onboardingUseCase: gh<_i645.OnboardingUseCase>(),
      ),
    );
    gh.lazySingleton<_i600.DioInterceptor>(
      () => _i600.DioInterceptor(gh<_i589.TokenStorage>()),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i600.DioInterceptor>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.lazySingleton<_i1004.RefreshRemoteDataSource>(
      () => _i259.RefreshRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.singleton<_i394.ApiServices>(
      () => dioModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i225.LogoutRemoteDataSource>(
      () => _i487.LogoutRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i26.UpdateProfileRemoteDataSource>(
      () => _i299.UpdateProfileRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i441.RunCodeRemoteDataSource>(
      () => _i328.RunCodeRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i386.AnswerMcqRemoteDataSource>(
      () => _i974.AnswerMcqRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i722.GetSessionRemoteDataSource>(
      () => _i550.GetSessionRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i335.SubmitAnswerRemoteDataSource>(
      () => _i725.SubmitAnswerRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i884.UpdateProfileRepo>(
      () =>
          _i577.UpdateProfileRepoImpl(gh<_i26.UpdateProfileRemoteDataSource>()),
    );
    gh.factory<_i224.SignupRemoteDataSource>(
      () => _i368.SignupRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i737.RefreshRepo>(
      () => _i462.RefreshRepoImpl(gh<_i1004.RefreshRemoteDataSource>()),
    );
    gh.factory<_i1049.UpdateProfileUseCase>(
      () => _i1049.UpdateProfileUseCase(gh<_i884.UpdateProfileRepo>()),
    );
    gh.factory<_i343.SubmitCodeRemoteDataSource>(
      () => _i243.SubmitCodeRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i291.InterviewSessionRemoteDataSource>(
      () => _i332.InterviewSessionRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i344.SubmitCodeRepo>(
      () => _i654.SubmitCodeRepoImpl(gh<_i343.SubmitCodeRemoteDataSource>()),
    );
    gh.factory<_i1011.GetProfileRemoteDataSource>(
      () => _i130.GetProfileRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i49.LoginRemoteDataSource>(
      () => _i1021.LoginRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i748.HistoryRemoteDataSource>(
      () => _i330.HistoryRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i1044.HistoryRepo>(
      () => _i633.HistoryRepoImpl(gh<_i748.HistoryRemoteDataSource>()),
    );
    gh.factory<_i969.AnswerMcqRepo>(
      () => _i933.AnswerMcqRepoImpl(gh<_i386.AnswerMcqRemoteDataSource>()),
    );
    gh.factory<_i81.LogoutRepo>(
      () => _i377.LogoutRepoImpl(
        gh<_i225.LogoutRemoteDataSource>(),
        gh<_i589.TokenStorage>(),
      ),
    );
    gh.factory<_i839.GetSessionRepo>(
      () => _i788.GetSessionRepoImpl(gh<_i722.GetSessionRemoteDataSource>()),
    );
    gh.factory<_i410.RunCodeRepo>(
      () => _i372.RunCodeRepoImpl(gh<_i441.RunCodeRemoteDataSource>()),
    );
    gh.factory<_i494.GetProfileRepo>(
      () => _i904.GetProfileRepoImpl(gh<_i1011.GetProfileRemoteDataSource>()),
    );
    gh.factory<_i134.SubmitAnswerRepo>(
      () =>
          _i1020.SubmitAnswerRepoImpl(gh<_i335.SubmitAnswerRemoteDataSource>()),
    );
    gh.factory<_i1040.GetSessionUseCase>(
      () => _i1040.GetSessionUseCase(gh<_i839.GetSessionRepo>()),
    );
    gh.factory<_i788.SignupRepo>(
      () => _i820.SignupRepoImpl(
        signupRemoteDataSource: gh<_i224.SignupRemoteDataSource>(),
      ),
    );
    gh.factory<_i976.LogoutUseCase>(
      () => _i976.LogoutUseCase(gh<_i81.LogoutRepo>()),
    );
    gh.factory<_i387.RefreshUsecase>(
      () => _i387.RefreshUsecase(gh<_i737.RefreshRepo>()),
    );
    gh.factory<_i473.SubmitCodeUseCase>(
      () => _i473.SubmitCodeUseCase(gh<_i344.SubmitCodeRepo>()),
    );
    gh.factory<_i540.LogoutCubit>(
      () => _i540.LogoutCubit(gh<_i976.LogoutUseCase>()),
    );
    gh.factory<_i372.RunCodeUseCase>(
      () => _i372.RunCodeUseCase(gh<_i410.RunCodeRepo>()),
    );
    gh.factory<_i917.AnswerMcqUseCase>(
      () => _i917.AnswerMcqUseCase(gh<_i969.AnswerMcqRepo>()),
    );
    gh.factory<_i1051.RunCodeCubit>(
      () => _i1051.RunCodeCubit(gh<_i372.RunCodeUseCase>()),
    );
    gh.factory<_i271.SubmitAnswerUsecase>(
      () => _i271.SubmitAnswerUsecase(gh<_i134.SubmitAnswerRepo>()),
    );
    gh.factory<_i750.InterviewSessionRepo>(
      () => _i816.InterviewSessionRepoImpl(
        gh<_i291.InterviewSessionRemoteDataSource>(),
      ),
    );
    gh.factory<_i308.LoginRepo>(
      () => _i612.LoginRepoImpl(gh<_i49.LoginRemoteDataSource>()),
    );
    gh.factory<_i244.McqWorkspaceCubit>(
      () => _i244.McqWorkspaceCubit(gh<_i917.AnswerMcqUseCase>()),
    );
    gh.factory<_i863.LoginUsecase>(
      () => _i863.LoginUsecase(gh<_i308.LoginRepo>()),
    );
    gh.factory<_i558.GetHistoryUsecase>(
      () => _i558.GetHistoryUsecase(gh<_i1044.HistoryRepo>()),
    );
    gh.factory<_i375.SignupUsecase>(
      () => _i375.SignupUsecase(signupRepo: gh<_i788.SignupRepo>()),
    );
    gh.factory<_i846.GetSessionCubit>(
      () => _i846.GetSessionCubit(gh<_i1040.GetSessionUseCase>()),
    );
    gh.factory<_i152.GetProfileUseCase>(
      () => _i152.GetProfileUseCase(gh<_i494.GetProfileRepo>()),
    );
    gh.factory<_i316.SubmitCodeCubit>(
      () => _i316.SubmitCodeCubit(gh<_i473.SubmitCodeUseCase>()),
    );
    gh.factory<_i407.LoginCubit>(
      () =>
          _i407.LoginCubit(gh<_i863.LoginUsecase>(), gh<_i589.TokenStorage>()),
    );
    gh.factory<_i65.SubmitAnswerCubit>(
      () => _i65.SubmitAnswerCubit(gh<_i271.SubmitAnswerUsecase>()),
    );
    gh.factory<_i461.SignupCubit>(
      () => _i461.SignupCubit(
        gh<_i375.SignupUsecase>(),
        gh<_i589.TokenStorage>(),
      ),
    );
    gh.factory<_i315.ProfileCubit>(
      () => _i315.ProfileCubit(
        gh<_i152.GetProfileUseCase>(),
        gh<_i1049.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i196.InterviewSessionUseCase>(
      () => _i196.InterviewSessionUseCase(gh<_i750.InterviewSessionRepo>()),
    );
    gh.factory<_i234.HistoryCubit>(
      () => _i234.HistoryCubit(gh<_i558.GetHistoryUsecase>()),
    );
    gh.factory<_i220.InterviewSessionCubit>(
      () => _i220.InterviewSessionCubit(gh<_i196.InterviewSessionUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i67.DioModule {}

class _$StorageModule extends _i371.StorageModule {}
