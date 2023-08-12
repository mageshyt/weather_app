import 'package:flutter/material.dart';
import 'package:weather_app/features/onboarding/widgets/grid_images.dart';
import 'package:weather_app/theme/pallet.dart';

class OnboardingView extends StatelessWidget {
  final VoidCallback onGetStartedTap;
  OnboardingView({Key? key, required this.onGetStartedTap}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => OnboardingView(
        onGetStartedTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF622FB5),
              Color(0xFF1B0F36),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.mirror),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          // image
          const GridImages(),

          const SizedBox(height: 40),

          // text
          const Text(
            'My Weather App',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),

          const SizedBox(height: 10),

          const Text(
            'Check Live weather updates all over the world with just one tap',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),

          //  Button
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                onGetStartedTap();
              },
              child: const Text('Get Started'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                foregroundColor: Colors.white,
                backgroundColor: Pallete.purpleColor,
                padding: const EdgeInsets.symmetric(vertical: 25),
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
