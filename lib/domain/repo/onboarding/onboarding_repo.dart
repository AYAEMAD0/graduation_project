import 'package:mock_mate_ai/domain/entities/onboarding/onboarding_entity.dart';

abstract class OnboardingRepo {
  List<OnboardingEntity> getOnboardingPages();

  List<OnboardingEntity> getOnboardingPagesMobile();
}
