import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/string.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';

// ignore: must_be_immutable
class CustomPopup extends StatelessWidget {
  CustomPopup({
    super.key,
    required this.title,
    this.description,
    required this.buttonsList,
    required this.image,
    this.onDismiss,
    this.richText,
  });
  final String title;
  String? description = "";
  List<String>? richText = [];
  final List<Widget> Function(double) buttonsList;
  final String image;
  Function()? onDismiss = () {};

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
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Image.asset(
                      image,
                      height: 130,
                      width: 130,
                    ),
                    description != null
                        ? RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              children: description!.addStyle(
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                                richText: richText ?? [""],
                                richStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    Column(
                      children: buttonsList(buttonWidth),
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
                    if (onDismiss != null) {
                      onDismiss!();
                    }
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
