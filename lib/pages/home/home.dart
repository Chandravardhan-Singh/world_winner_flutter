import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/widget/carbon_buy_card.dart';
import 'package:world_winner_flutter/widget/play_counter.dart';
import 'package:world_winner_flutter/widget/share_connect_card.dart';
import 'package:world_winner_flutter/widget/ticket/ticket_stack.dart';
import 'package:world_winner_flutter/widget/ticket/winning_numbers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DraggableScrollableController draggableScrollController =
      DraggableScrollableController();
  final ScrollController homeScrollController = ScrollController();

  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    double initialChildSize = (MediaQuery.of(context).size.height - 600) /
        MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        centerTitle: false,
        title: Text(context.localization!.title_home),
        elevation: 0,
        backgroundColor: themeColor.secondary,
      ),
      backgroundColor: themeColor.secondary,
      body: SingleChildScrollView(
        controller: homeScrollController,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: themeColor.secondary,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  const PlayCounter(),
                  const SizedBox(height: 10),
                  ShareConnectCard(),
                  const SizedBox(height: 15),
                  CarbonBuyCard(),
                  const SizedBox(height: 15),
                  PreviousWinningNumbers(),
                ],
              ),
              DraggableScrollableSheet(
                snapAnimationDuration: const Duration(milliseconds: 200),
                maxChildSize: 1,
                minChildSize: initialChildSize,
                controller: draggableScrollController,
                expand: false,
                snap: true,
                snapSizes: [initialChildSize, 1],
                initialChildSize: initialChildSize,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: TicketStack(
                        isExpanded: isExpanded,
                        onTicketPress: () {
                          homeScrollController.animateTo(
                            1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );
                          draggableScrollController
                              .animateTo(
                                1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.linear,
                              )
                              .then((value) => {
                                    setState(() {
                                      isExpanded = true;
                                    })
                                  });
                        },
                        closeTicketsOverlay: () {
                          draggableScrollController
                              .animateTo(
                                initialChildSize,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.linear,
                              )
                              .then(
                                (value) => {
                                  setState(() {
                                    isExpanded = false;
                                  })
                                },
                              );
                        },
                        openTicketsOverlay: () {
                          homeScrollController.animateTo(
                            1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );
                          draggableScrollController
                              .animateTo(
                                1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.linear,
                              )
                              .then(
                                (value) => {
                                  setState(() {
                                    isExpanded = true;
                                  })
                                },
                              );
                        },
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
