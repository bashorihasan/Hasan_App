import 'package:flutter/material.dart';
import 'package:hasan_app/modules/on_boarding/widget/on_boarding_corousel.dart';
import 'package:hasan_app/config/colors.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const OnBoardingCorousel(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Good coffee,",
                  style: TextStyle(
                    color: CustomColor.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Good friends,",
                  style: TextStyle(
                    color: CustomColor.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "let it blends",
                  style: TextStyle(
                    color: CustomColor.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "The best grain, the finest roast,",
                  style: TextStyle(
                    color: CustomColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "the most powerful flavor.",
                  style: TextStyle(
                    color: CustomColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 55),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 91, vertical: 19),
                    decoration: BoxDecoration(
                      color: CustomColor.primary,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                          color: CustomColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
