import '../../../../domain/entities/onboarding/onboarding_entity.dart';

abstract class OnboardingLocalDataSource {
  List<OnboardingEntity> getPages();

  List<OnboardingEntity> getPagesMobile();
}
