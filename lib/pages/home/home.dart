import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/widget/carbon_buy_card.dart';
import 'package:world_winner_flutter/widget/coupon_counter.dart';
import 'package:world_winner_flutter/widget/custom_drawer.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final DraggableScrollableController draggableScrollController =
      DraggableScrollableController();
  final ScrollController homeScrollController = ScrollController();

  bool isExpanded = true;

  void _popUpTicket() {
    homeScrollController.animateTo(
      1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    draggableScrollController
        .animateTo(
          1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        )
        .then(
          (value) => {
            setState(() {
              isExpanded = true;
            })
          },
        );
  }

  void _closeTicket(double initialChildSize) {
    draggableScrollController
        .animateTo(
          initialChildSize,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceOut,
        )
        .then(
          (value) => {
            setState(() {
              isExpanded = false;
            })
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    double initialChildSize = (MediaQuery.of(context).size.height - 620) /
        MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset('assets/images/drawer-icon.png'),
        ),
        centerTitle: false,
        title: Text(context.localization!.title_home),
        elevation: 0,
        backgroundColor: themeColor.secondary,
        actions: const [
          CouponCounter(),
        ],
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
                  const SizedBox(height: 20),
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
                        onTicketPress: _popUpTicket,
                        closeTicketsOverlay: () =>
                            _closeTicket(initialChildSize),
                        openTicketsOverlay: _popUpTicket,
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
