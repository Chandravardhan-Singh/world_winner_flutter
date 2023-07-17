import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/pages/onboarding-share-carbon/onboarding_share_carbon.dart';
import 'package:world_winner_flutter/widget/button.dart';

class NotificationPermission extends StatelessWidget {
  const NotificationPermission({super.key});

  void getNotificationPermission() async {
    await Permission.notification.isDenied.then((isDenied) {
      if (isDenied) {
        Permission.notification.request();
      }
    });
  }

  void skipPermission(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingShareCarbon(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      context.localization!.notification_title,
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
                Image.asset(
                  'assets/images/bell.png',
                  height: 140,
                ),
                const SizedBox(height: 30),
                Text(
                  context.localization!.notification_description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.72,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 60),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 88, 0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 255, 88, 0)
                                      .withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            context
                                .localization!.notification_description_point_1,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 88, 0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 255, 88, 0)
                                      .withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            context
                                .localization!.notification_description_point_2,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 88, 0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 255, 88, 0)
                                      .withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            context
                                .localization!.notification_description_point_3,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Button(
                  text: context.localization!.button_allow,
                  onPressed: getNotificationPermission,
                  backgroundColor: const Color.fromARGB(255, 255, 88, 0),
                  textColor: Colors.white,
                ),
                const SizedBox(height: 10),
                Button(
                  type: ButtonType.textButton,
                  text: context.localization!.button_skip,
                  onPressed: () => skipPermission(context),
                  backgroundColor: Colors.white,
                  textColor: const Color.fromARGB(255, 255, 88, 0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
