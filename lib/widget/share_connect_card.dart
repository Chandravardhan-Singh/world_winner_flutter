import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';
import 'package:world_winner_flutter/widget/button.dart';

class ShareConnectCard extends StatelessWidget {
  ShareConnectCard({super.key});

  final Image img = Image.asset('assets/images/share-card-bg.png');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - defaultGap,
      height: 118,
      decoration: BoxDecoration(
        image: DecorationImage(image: img.image, fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/share-logo.png',
              width: 40,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localization!.link_share_description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Button(
                    text: context.localization!.button_connect_now,
                    onPressed: () {},
                    type: ButtonType.iconButton,
                    backgroundColor: Colors.white,
                    textColor: const Color.fromRGBO(182, 5, 77, 1),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
