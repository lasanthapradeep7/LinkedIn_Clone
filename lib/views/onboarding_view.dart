import 'dart:async';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/views/login_view.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:linkedin_clone/view_models/onboarding_view_model.dart';
import 'package:linkedin_clone/views/shared_onboarding_view.dart';
import 'package:linkedin_clone/views/signup_view.dart';
import '../constants/colors.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_controller.page == 2) {
        // If on last page, go back to first page
        _controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      } else {
        // Otherwise, move to the next page
        _controller.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final onboardingList =
        Provider.of<OnboardingViewModel>(context).onboardingList;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo image
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
                  // Onboarding pages list
                  PageView.builder(
                    controller: _controller,
                    itemCount: onboardingList.length,
                    itemBuilder: (context, index) {
                      final onboarding = onboardingList[index];
                      return SharedOnboardingView(
                        title: onboarding.title,
                        imagePath: onboarding.imagePath,
                        description: onboarding.description,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  // Page indicators
                  Container(
                    alignment: const Alignment(0, 1),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const WormEffect(
                        activeDotColor: primaryColor,
                        dotColor: thirdColor,
                        dotHeight: 4,
                        dotWidth: 15,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupView()),
                      );
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
                        color: primaryColor,
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
