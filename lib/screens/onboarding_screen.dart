import 'package:flutter/material.dart';
import 'package:linkedin_clone/screens/shared_onboarding_screen.dart';
import 'package:linkedin_clone/view_models/onboarding_view_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool showHomePage = false;

  // ...existing code...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust layout
          children: [
            //logo image
            Container(
              alignment: const Alignment(0, -0.5),
              child: Image.asset(
                'assets/images/logo.png',
                width: 120,
                height: 120,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  //Onboarding pages list is passed here
                  PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        showHomePage = index == 3;
                      });
                    },
                    children: [
                      SharedOnboardingScreen(
                        title: OnboardingViewModel.onboardingList[0].title,
                        imagePath:
                            OnboardingViewModel.onboardingList[0].imagePath,
                        description:
                            OnboardingViewModel.onboardingList[0].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingViewModel.onboardingList[1].title,
                        imagePath:
                            OnboardingViewModel.onboardingList[1].imagePath,
                        description:
                            OnboardingViewModel.onboardingList[1].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingViewModel.onboardingList[2].title,
                        imagePath:
                            OnboardingViewModel.onboardingList[2].imagePath,
                        description:
                            OnboardingViewModel.onboardingList[2].description,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //the page indicators
                  Container(
                    alignment: const Alignment(0, 1),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const WormEffect(
                        activeDotColor: Colors.blue,
                        dotColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Login and Sign-up buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to login screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreen(), // Replace with your LoginScreen widget
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Navigate to sign-up screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SignUpScreen(), // Replace with your SignUpScreen widget
                      //   ),
                      // );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
