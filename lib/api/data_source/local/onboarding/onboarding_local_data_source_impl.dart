import 'package:injectable/injectable.dart';
import 'package:mock_mate_ai/api/model/onboarding/onboarding_model_dto.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';

import '../../../../data/data_source/local/onboarding/onboarding_local_data_source.dart';
import '../../../../domain/entities/onboarding/onboarding_entity.dart';

@Injectable(as: OnboardingLocalDataSource)
class OnboardingLocalDataSourceImpl extends OnboardingLocalDataSource {
  @override
  List<OnboardingEntity> getPages() {
    // final List<OnboardingModelDTO> dtos = [
    //   OnboardingModelDTO(
    //     title: "Personalized Interviews",
    //     image: AppAsset.onboarding1Image,
    //     description: "Upload your CV or job description to get personalized interview questions.",
    //   ),
    //   OnboardingModelDTO(
    //     title: "Real Interview Practice",
    //     image: AppAsset.onboarding2Image,
    //     description: "Timed MCQs and coding challenges that feel like the real thing",
    //   ),
    //   OnboardingModelDTO(
    //     title: "Track Your Progress",
    //     image: AppAsset.onboarding3Image,
    //     description: "View scores, history, and insights to improve your performance",
    //   ),
    // ];

    final List<OnboardingModelDTO> dtos = [
      OnboardingModelDTO(
        title: "Personalized Interview Experience",
        image: AppAsset.onboarding1Image,
        description: "Upload your CV or paste a job description to receive fully customized interview\n questions tailored to your skills,experience, and target role.Our smart system \nanalyzes your profile to generate relevant technical,behavioral,and \nrole-specific questions.",
      ),
      OnboardingModelDTO(
        title: "Practice Like It’s the Real Interview",
        image: AppAsset.onboarding2Image,
        description: "Experience timed MCQs, coding challenges, and scenario-based questions designed\n to simulate real interview environments.Get instant feedback, improve your \nproblem-solving speed,and build confidence under pressure.",
      ),
      OnboardingModelDTO(
        title: "Track, Improve, and Succeed",
        image: AppAsset.onboarding3Image,
        description: "Monitor your scores, review past attempts, and gain detailed performance insights.\nIdentify your strengths,discover areas for improvement, and follow your growth \njourney step by step until you're fully interview-ready.",
      ),
    ];
    return dtos.map((e) => e.toEntity(),).toList();
  }

  @override
  List<OnboardingEntity> getPagesMobile() {
    final List<OnboardingModelDTO> dtos = [
      OnboardingModelDTO(
        title: "Personalized Interviews",
        image: AppAsset.onboarding1Image,
        description: "Upload your CV or job description to get personalized interview questions.",
      ),
      OnboardingModelDTO(
        title: "Real Interview Practice",
        image: AppAsset.onboarding2Image,
        description: "Timed MCQs and coding challenges that feel like the real thing",
      ),
      OnboardingModelDTO(
        title: "Track Your Progress",
        image: AppAsset.onboarding3Image,
        description: "View scores, history, and insights to improve your performance",
      ),
    ];
    return dtos.map((e) => e.toEntity(),).toList();
  }
}
