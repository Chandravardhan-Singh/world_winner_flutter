import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/pages/past-results/watch_now_card.dart';
import 'package:world_winner_flutter/widget/coupon_counter.dart';
import 'package:world_winner_flutter/widget/custom_drawer.dart';
import 'package:world_winner_flutter/widget/result_card.dart';

class PastResults extends StatelessWidget {
  PastResults({super.key});
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
        title: Text(context.localization!.title_past_result),
        elevation: 0,
        backgroundColor: themeColor.secondary,
        actions: const [
          CouponCounter(),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          WatchNow(),
          ...List.generate(5, (index) => null)
              .map((e) => const ResultCard())
              .toList()
        ],
      ),
    );
  }
}
