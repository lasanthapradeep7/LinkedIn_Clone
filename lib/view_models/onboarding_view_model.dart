import 'package:linkedin_clone/models/onboarding_model.dart';

class OnboardingViewModel {
  static final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      imagePath: 'assets/images/onboarding_1.jpg',
      title: 'Land your Job',
      description:
          'Connect, Apply and Get Hired with your favorite job around the world.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboarding_2.jpg',
      title: 'Build Your Network',
      description: 'Follow people, companies, and stay in the loop.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboarding_3.jpg',
      title: 'Find Your Dream Job',
      description: 'Discover job opportunities tailored to your skills.',
    ),
  ];
}
