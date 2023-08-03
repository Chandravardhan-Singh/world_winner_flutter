import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';
import 'package:world_winner_flutter/widget/button.dart';

class WatchNow extends StatelessWidget {
  WatchNow({super.key});

  final Image img = Image.asset('assets/images/leafs-bg.png');

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: MediaQuery.of(context).size.width - defaultGap,
        height: 97,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(image: img.image, fit: BoxFit.fill),
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              color: Colors.black12,
              offset: Offset(0, 0),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/draw-strip.png',
                width: 18,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Today’s draw is LIVE now!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Button(
                      text: context.localization!.button_connect_now,
                      onPressed: () {},
                      type: ButtonType.iconButton,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      textColor: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
