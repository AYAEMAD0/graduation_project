import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/model/onboarding_model_dto.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import '../../../../data/data_source/local/onboarding/onboarding_local_data_source.dart';
import '../../../../domain/entities/onboarding_entity.dart';

@Injectable(as: OnboardingLocalDataSource)
class OnboardingLocalDataSourceImpl extends OnboardingLocalDataSource {
  @override
  List<OnboardingEntity> getPages() {
    final List<OnboardingModelDTO> dtos = [
      OnboardingModelDTO(
        title: "Personalized \nInterviews",
        image: AppAsset.onboarding1Image,
        description: "Upload your CV or job description to get personalized interview questions.",
      ),
      OnboardingModelDTO(
        title: "Real Interview \nPractice",
        image: AppAsset.onboarding2Image,
        description: "Timed MCQs and coding challenges that feel like the real thing",
      ),
      OnboardingModelDTO(
        title: "Track Your \nProgress",
        image: AppAsset.onboarding3Image,
        description: "View scores, history, and insights to improve your performance",
      ),
    ];
    return dtos.map((e) => e.toEntity(),).toList();
  }
}
