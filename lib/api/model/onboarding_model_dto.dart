import '../../domain/entities/onboarding_entity.dart';

class OnboardingModelDTO {
  final String title;
  final String image;
  final String description;

  OnboardingModelDTO({
    required this.title,
    required this.image,
    required this.description,
  });

  OnboardingEntity toEntity() {
    return OnboardingEntity(
      title: title,
      image: image,
      description: description,
    );
  }
}
