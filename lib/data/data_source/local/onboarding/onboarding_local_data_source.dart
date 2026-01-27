import '../../../../domain/entities/onboarding_entity.dart';

abstract class OnboardingLocalDataSource {
  List<OnboardingEntity> getPages();
}
