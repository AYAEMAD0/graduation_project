import 'package:injectable/injectable.dart';
import '../entities/onboarding_entity.dart';
import '../repo/onboarding_repo.dart';

@injectable
class OnboardingUseCase {
  final OnboardingRepo onboardingRepo;

  OnboardingUseCase({required this.onboardingRepo});

  List<OnboardingEntity> call() {
    return onboardingRepo.getOnboardingPages();
  }
}
