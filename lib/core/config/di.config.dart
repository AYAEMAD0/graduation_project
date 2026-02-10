// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/data_source/local/onboarding/onboarding_local_data_source_impl.dart'
    as _i382;
import '../../data/data_source/local/onboarding/onboarding_local_data_source.dart'
    as _i697;
import '../../data/repo_impl/onboarding_repo_impl.dart' as _i874;
import '../../domain/repo/onboarding_repo.dart' as _i774;
import '../../domain/usecase/onboarding_usecase.dart' as _i828;
import '../../features/onboarding_screen/viewmodel/onboarding_cubit.dart'
    as _i1035;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i697.OnboardingLocalDataSource>(
      () => _i382.OnboardingLocalDataSourceImpl(),
    );
    gh.factory<_i774.OnboardingRepo>(
      () => _i874.OnboardingRepoImpl(
        localDataSource: gh<_i697.OnboardingLocalDataSource>(),
      ),
    );
    gh.factory<_i828.OnboardingUseCase>(
      () => _i828.OnboardingUseCase(onboardingRepo: gh<_i774.OnboardingRepo>()),
    );
    gh.factory<_i1035.OnboardingCubit>(
      () => _i1035.OnboardingCubit(
        onboardingUseCase: gh<_i828.OnboardingUseCase>(),
      ),
    );
    return this;
  }
}
