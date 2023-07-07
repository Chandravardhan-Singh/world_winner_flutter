import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/extensions/string.dart';
import 'package:world_winner_flutter/widget/button.dart';

class OnboardingPhoneNumber extends StatelessWidget {
  const OnboardingPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 30, 103),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding-phone-number-bg.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 53),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'What\'s your\nnumber?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.72,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 69),
                const Text(
                  "Phone number",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 9),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 0.5)),
                  child: const Row(
                    children: [
                      Text(
                        "+971",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: Color.fromARGB(255, 255, 88, 0),
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        children: context
                            .localization!.onboarding_phone_terms_and_conditions
                            .addStyle(
                          style: const TextStyle(),
                          richText: [
                            "Terms",
                            "&",
                            "Conditions",
                            "\nPrivacy",
                            "Policy",
                          ],
                          richStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Button(
              text: context.localization!.button_next,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
