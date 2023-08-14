import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/string.dart';
import 'package:world_winner_flutter/models/number_list.dart';
import 'package:world_winner_flutter/pages/setup-autoplay/widget/add_ticket.dart';
import 'package:world_winner_flutter/pages/setup-autoplay/widget/pick_number_card.dart';
import 'package:world_winner_flutter/pages/setup-autoplay/widget/ticket_setup_count.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/coupon_counter.dart';
import 'package:world_winner_flutter/widget/custom_drawer.dart';

final data = [
  NumberList(list: ['12', '11', '01', '02', '08', '99', '44']),
  NumberList(list: ['10', '88', '44', '22', '99', '11', '22']),
];

class SetupAutoplay extends StatelessWidget {
  SetupAutoplay({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: 70,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset(
            'assets/images/drawer-icon.png',
          ),
        ),
        centerTitle: false,
        title: const Text('Setup Autoplay'),
        elevation: 0,
        backgroundColor: themeColor.secondary,
        actions: const [
          CouponCounter(),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: defaultGap),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultGap,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TicketSetupCounter(),
                      AddTicket(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ...data
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: PickNumberCard(
                          numbers: e,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 150,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    blurStyle: BlurStyle.normal,
                    color: Colors.black.withOpacity(0.07),
                    offset: Offset(1, 1),
                    spreadRadius: 6,
                  )
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      children: " New to autoplay? Learn the rules"
                          .toUpperCase()
                          .addStyle(
                            style: const TextStyle(),
                            richText: ["LEARN", "THE", "RULES"],
                            richStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Button(
                    text: 'sETUP AUTOPLAY with 2 tickets',
                    onPressed: () {},
                    textColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
