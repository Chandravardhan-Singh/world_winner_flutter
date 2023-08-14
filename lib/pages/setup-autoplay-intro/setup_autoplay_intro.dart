import 'package:flutter/material.dart';
import 'package:world_winner_flutter/models/autoplay_intro.dart';
import 'package:world_winner_flutter/pages/setup-autoplay/setup_autoplay.dart';
import 'package:world_winner_flutter/widget/button.dart';

class SetupAutoplayIntro extends StatefulWidget {
  const SetupAutoplayIntro({super.key});

  @override
  State<SetupAutoplayIntro> createState() => _SetupAutoplayIntroState();
}

final data = [
  AutoplayIntro(
      title: "Never miss a draw",
      image: 'assets/images/what-is-autoplay.png',
      description:
          "Join in every week, be part of the draw and increase your chances of winning."),
  AutoplayIntro(
      title: "Collect your prizes",
      image: 'assets/images/what-is-autoplay-2.png',
      description: "Once you’ve won, simply come back \nand cash out."),
  AutoplayIntro(
      title: "Pick your numbers",
      image: 'assets/images/what-is-autoplay-3.png',
      description:
          "Choose your favourite numbers to automatically enter upcoming draws.")
];

class _SetupAutoplayIntroState extends State<SetupAutoplayIntro> {
  int currentIndex = 0;

  void onSkipPressed() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => SetupAutoplay(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    AutoplayIntro currentItem = data[currentIndex];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 30, 103),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/setup-autoplay-intro-bg.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "What is\nAutoplay?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Image.asset(currentItem.image),
                const SizedBox(
                  height: 47,
                ),
                Text(
                  currentItem.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  currentItem.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: data
                      .map(
                        (e) => Container(
                          height: 3,
                          width: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: e.title == currentItem.title
                                ? Theme.of(context).colorScheme.primary
                                : Colors.black45,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 23,
                ),
                Button(
                  text: currentIndex == data.length - 1
                      ? "sETUP AUTOPLAY"
                      : 'next',
                  onPressed: () {
                    if (currentIndex < data.length - 1) {
                      setState(() {
                        currentIndex++;
                      });
                    } else {
                      onSkipPressed();
                    }
                  },
                  backgroundColor: const Color.fromARGB(255, 255, 88, 0),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: InkWell(
              onTap: onSkipPressed,
              child: Text(
                'skip'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
