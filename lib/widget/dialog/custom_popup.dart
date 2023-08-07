import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/string.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';
import 'package:world_winner_flutter/widget/button.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth =
        MediaQuery.of(context).size.width - ((6 * 2) + (defaultGap / 2));
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: defaultGap / 4,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Insufficient \ncoupons",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/dialog/warning.png',
                      height: 130,
                      width: 130,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children:
                            "You do not have enough coupons to play World \nWinners at the moment. You may buy Carbon \nOffsets or redeem SHARE points to get more \ncoupons."
                                .addStyle(
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          richText: ["redeem", "SHARE", "points"],
                          richStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Button(
                          text: 'buy carbon offset',
                          onPressed: () {},
                          textColor: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          width: buttonWidth,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Button(
                          text: 'redeem share points',
                          onPressed: () {},
                          textColor: Colors.white,
                          backgroundColor: const Color.fromRGBO(182, 5, 77, 1),
                          width: buttonWidth,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
