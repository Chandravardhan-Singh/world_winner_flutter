import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/pages/past-results/past_results.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 180,
            child: DrawerHeader(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.network(
                              'https://images.pexels.com/photos/14807470/pexels-photo-14807470.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                              height: 35,
                              width: 35,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'CVS',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 118,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/images/leaf-bg.png').image,
                fit: BoxFit.fill,
              ),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/carbon-leaf.png',
                  width: 40,
                  // height: 40,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.localization!.link_carbon_description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Button(
                      text: context.localization!.button_buy_now,
                      onPressed: () {},
                      type: ButtonType.iconButton,
                      backgroundColor: Colors.white,
                      textColor: const Color.fromRGBO(142, 188, 10, 1),
                    )
                  ],
                )
              ],
            ),
          ),
          DrawerItem(title: 'Home', onTap: () {}),
          DrawerItem(title: 'Setup Autoplay', onTap: () {}),
          DrawerItem(title: 'SHARE Dashboard', onTap: () {}),
          DrawerItem(
              title: 'Past Results',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PastResults(),
                  ),
                );
              }),
          DrawerItem(title: 'Transaction History', onTap: () {}),
          DrawerItem(title: 'Cash Out', onTap: () {}),
          DrawerItem(title: 'How to Play', onTap: () {}),
          DrawerItem(title: 'About World Winners', onTap: () {}),
          const SizedBox(height: 20),
          Button(
            text: context.localization!.button_play_now,
            onPressed: () {},
            textColor: Colors.white,
            backgroundColor: Colors.black,
            type: ButtonType.gradient,
            width: 250,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
