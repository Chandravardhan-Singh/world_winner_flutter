// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:world_winner_flutter/extensions/string.dart';

// ignore: must_be_immutable
class Ticket extends StatefulWidget {
  Function() onVerticalDragUp;
  Function() onVerticalDragDown;
  Function() onVerticalDragEnd;
  Function() onTicketPress;

  double? top = 0;
  double? left = 0;
  double? bottom = 0;
  double? right = 0;

  Ticket({
    Key? key,
    required this.onVerticalDragUp,
    required this.onVerticalDragDown,
    required this.onVerticalDragEnd,
    required this.onTicketPress,
    this.top,
    this.left,
    this.bottom,
    this.right,
  }) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  final Image img = Image.asset('assets/images/long-ticket-bg.png');

  @override
  Widget build(BuildContext context) {
    final ticketHeight = MediaQuery.of(context).size.height * 0.65;
    final ticketWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).size.width * 0.1;

    return AnimatedPositioned(
      bottom: widget.bottom,
      top: widget.top,
      left: widget.left,
      right: widget.right,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onTicketPress,
        onVerticalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dy > sensitivity) {
            widget.onVerticalDragDown();
          } else if (details.delta.dy < -sensitivity) {
            widget.onVerticalDragUp();
          }
        },
        onVerticalDragEnd: (details) {
          widget.onVerticalDragEnd();
        },
        child: Center(
          child: Container(
            width: ticketWidth,
            height: ticketHeight,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  blurStyle: BlurStyle.normal,
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  spreadRadius: 5,
                )
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: ticketWidth,
                    height: ticketHeight - 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: img.image,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        RichText(
                          text: TextSpan(
                            children: "Win up to AED 35,000 weekly &".addStyle(
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              richText: ['35,000', 'weekly'],
                              richStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const Text("AED 1,000,000 monthly",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 18),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Draw Date",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "12 December 2022",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Tickets",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "2",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/long-ticket-strip.png',
                    width: 18,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 30,
                  bottom: 20,
                  child: Image.asset(
                    'assets/images/logo-ticket.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
