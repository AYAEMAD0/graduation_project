import 'package:injectable/injectable.dart';

import '../../entities/onboarding/onboarding_entity.dart';
import '../../repo/onboarding/onboarding_repo.dart';

@injectable
class OnboardingUseCase {
  final OnboardingRepo onboardingRepo;

  OnboardingUseCase({required this.onboardingRepo});

  List<OnboardingEntity> call() {
    return onboardingRepo.getOnboardingPages();
  }

  List<OnboardingEntity> callMobile() {
    return onboardingRepo.getOnboardingPagesMobile();
  }
}
