import 'package:chatly_ai/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  final RxInt currentPage = 0.obs;

  final List<OnboardingModel> pages = const [
    OnboardingModel(
      animation: 'assets/lottie/ai_chat.json',
      title: 'Chat Smarter',
      description: 'Ask questions and get intelligent answers instantly.',
    ),
    OnboardingModel(
      animation: 'assets/lottie/image_generation.json',
      title: 'Create Anything',
      description: 'Generate ideas, write content and solve problems with AI.',
    ),
    OnboardingModel(
      animation: 'assets/lottie/language_translation.json',
      title: 'Your AI Assistant',
      description: 'Your personal AI assistant is always ready to help.',
    ),
  ];

  bool get isLastPage => currentPage.value == pages.length - 1;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (isLastPage) {
      goToHome();
      return;
    }

    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void skip() {
    goToHome();
  }

  void goToHome() {
    Get.offAllNamed('/home');
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
