import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/extensions/string.dart';
import 'package:world_winner_flutter/pages/onboarding-phone-number/onboarding_phone_number.dart';
import 'package:world_winner_flutter/widget/button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void navigateToOnboarding(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingPhoneNumber(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 30, 103),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              Color.fromARGB(255, 22, 49, 166),
              Color.fromARGB(255, 14, 30, 103),
            ],
            stops: <double>[0.4, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 25),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 10),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.localization!.landing_page_title,
                          style: const TextStyle(
                            fontSize: 38,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 10,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              children: context
                                  .localization!.landing_page_description
                                  .addStyle(
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                                richText: ["AED", "35,000", "1,000,000"],
                                richStyle: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/landing-page-art.png',
                    width: double.infinity,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Button(
                onPressed: () => navigateToOnboarding(context),
                text: context.localization!.button_get_started,
              ),
            )
          ],
        ),
      ),
    );
  }
}
