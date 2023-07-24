import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/widget/carbon_buy_card.dart';
import 'package:world_winner_flutter/widget/share_connect_card.dart';
import 'package:world_winner_flutter/widget/ticket/play_counter.dart';
import 'package:world_winner_flutter/widget/ticket/winning_numbers.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        centerTitle: false,
        title: Text(context.localization!.title_home),
        elevation: 0,
        backgroundColor: themeColor.secondary,
      ),
      body: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: themeColor.secondary,
          ),
          child: SingleChildScrollView(
              child: Column(
            children: [
              const PlayCounter(),
              const SizedBox(height: 10),
              ShareConnectCard(),
              const SizedBox(height: 15),
              CarbonBuyCard(),
              const SizedBox(height: 15),
              PreviousWinningNumbers(),
              const SizedBox(height: 15),
            ],
          ))),
    );
  }
}
