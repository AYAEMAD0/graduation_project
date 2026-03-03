import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/domain/entities/onboarding/onboarding_entity.dart';

import '../../../domain/repo/onboarding/onboarding_repo.dart';
import '../../data_source/local/onboarding/onboarding_local_data_source.dart';

@ Injectable(as: OnboardingRepo)
class OnboardingRepoImpl implements OnboardingRepo {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepoImpl({required this.localDataSource});

  @override
  List<OnboardingEntity> getOnboardingPages() {
    return localDataSource.getPages();
  }

  @override
  List<OnboardingEntity> getOnboardingPagesMobile() {
    return localDataSource.getPagesMobile();
  }
}
