import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/onboarding_entity.dart';
import '../../../domain/usecase/onboarding_usecase.dart';

@injectable
class OnboardingCubit extends Cubit<int> {
  final OnboardingUseCase onboardingUseCase;
  List<OnboardingEntity> pages = [];

  OnboardingCubit({required this.onboardingUseCase}) : super(0) {
    loadPages();
  }

  void loadPages() {
    pages = onboardingUseCase.call();
  }

  void setPage(int index) => emit(index);

  void nextPage() {
    if (state < pages.length - 1) emit(state + 1);
  }

  void skip() => emit(pages.length - 1);
}
