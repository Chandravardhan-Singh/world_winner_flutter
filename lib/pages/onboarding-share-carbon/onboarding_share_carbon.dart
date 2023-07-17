import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/pages/home/home.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/carbon_buy_card.dart';
import 'package:world_winner_flutter/widget/share_connect_card.dart';

class OnboardingShareCarbon extends StatelessWidget {
  const OnboardingShareCarbon({super.key});

  void skipPressed(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 30, 103),
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/notification-permission-bg.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 53),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.localization!.connect_carbon_share_title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.72,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    context.localization!.connect_carbon_share_desc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ShareConnectCard(),
                  const SizedBox(height: 15),
                  CarbonBuyCard(),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Button(
                type: ButtonType.textButton,
                text: context.localization!.skip_for_now,
                onPressed: () => skipPressed(context),
                backgroundColor: const Color.fromARGB(255, 255, 88, 0),
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
